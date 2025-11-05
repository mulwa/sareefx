import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:logger/logger.dart';

/// Response codes enum for better type safety
class ResponseCodes {
  static const String success = '000';
  static const String missingPlatform = '001';
  static const String invalidPlatform = '002';
  static const String missingAppVersion = '003';
  static const String appUpdateRequired = '004';
  static const String unauthorized = '005';
  static const String accessDenied = '006';
  static const String rateLimitExceeded = '007';
  static const String userCreationFailed = '008';
  static const String notFound = '009';
  static const String authFailed = '010';
  static const String transactionFailed = '011';
  static const String forbidden = '012';
  static const String badRequest = '013';
  static const String internalServerError = '999';
}

/// Custom exception for network errors
class NetworkException implements Exception {
  final String message;
  final int? statusCode;
  final String? responseCode;
  final dynamic data;

  NetworkException(
    this.message, {
    this.statusCode,
    this.responseCode,
    this.data,
  });

  bool get isUnauthorized =>
      responseCode == ResponseCodes.unauthorized ||
      responseCode == ResponseCodes.authFailed;

  bool get isAccessDenied => responseCode == ResponseCodes.accessDenied;

  bool get isUpdateRequired => responseCode == ResponseCodes.appUpdateRequired;

  bool get isRateLimited => responseCode == ResponseCodes.rateLimitExceeded;

  bool get isNotFound => responseCode == ResponseCodes.notFound;

  @override
  String toString() =>
      'NetworkException: $message ${responseCode != null ? '(Code: $responseCode)' : ''} ${statusCode != null ? '(Status: $statusCode)' : ''}';
}

/// Network service class for handling all HTTP requests
class NetworkService extends GetxService {
  static NetworkService get to => Get.find();

  // Base configuration
  String _baseUrl = '';
  final _defaultHeaders = <String, String>{
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Platform': Platform.isAndroid ? 'Android' : 'iOS',
    'App-Version': '3',
  }.obs;
  Duration _timeout = const Duration(seconds: 30);
  final _authToken = Rxn<String>();

  // Loading state
  final isLoading = false.obs;

  // Response code configuration
  String _successCode = ResponseCodes.success;
  String _responseCodeKey = 'responseCode';
  String _responseMessageKey = 'responseDescription';
  String _responseDataKey = 'data';

  // Callbacks for specific response codes
  Function(NetworkException)? onUnauthorized;
  Function(NetworkException)? onAppUpdateRequired;
  Function(NetworkException)? onAccessDenied;

  /// Initialize the network service
  Future<NetworkService> init({
    required String baseUrl,
    Map<String, String>? headers,
    Duration? timeout,
    String successCode = '000',
    String responseCodeKey = 'responseCode',
    String responseMessageKey = 'responseDescription',
    String responseDataKey = 'data',
    Function(NetworkException)? onUnauthorized,
    Function(NetworkException)? onAppUpdateRequired,
    Function(NetworkException)? onAccessDenied,
  }) async {
    _baseUrl = baseUrl;
    if (headers != null) _defaultHeaders.addAll(headers);
    if (timeout != null) _timeout = timeout;
    _successCode = successCode;
    _responseCodeKey = responseCodeKey;
    _responseMessageKey = responseMessageKey;
    _responseDataKey = responseDataKey;
    this.onUnauthorized = onUnauthorized;
    this.onAppUpdateRequired = onAppUpdateRequired;
    this.onAccessDenied = onAccessDenied;
    return this;
  }

  /// Set authentication token
  void setAuthToken(String token) {
    _authToken.value = token;
    _defaultHeaders['Authorization'] = 'Bearer $token';
  }

  /// Clear authentication token
  void clearAuthToken() {
    _authToken.value = null;
    _defaultHeaders.remove('Authorization');
  }

  /// Get current auth token
  String? get authToken => _authToken.value;

  /// Check if user is authenticated
  bool get isAuthenticated => _authToken.value != null;

  /// Add custom header
  void addHeader(String key, String value) {
    _defaultHeaders[key] = value;
  }

  /// Remove custom header
  void removeHeader(String key) {
    _defaultHeaders.remove(key);
  }

  /// Build complete URL
  String _buildUrl(String endpoint) {
    if (endpoint.startsWith('http')) return endpoint;
    return '$_baseUrl$endpoint';
  }

  /// Merge headers
  Map<String, String> _mergeHeaders(Map<String, String>? customHeaders) {
    return {..._defaultHeaders, ...?customHeaders};
  }

  /// Handle response with custom application response codes
  dynamic _handleResponse(http.Response response) {
    Logger().d(
      'Response Status: ${response.statusCode}\nBody: ${response.body}',
    );

    // If body is empty, just return null or throw
    if (response.body.isEmpty) {
      throw NetworkException(
        'Empty response from server',
        statusCode: response.statusCode,
      );
    }

    dynamic jsonResponse;
    try {
      jsonResponse = json.decode(response.body);
    } catch (e) {
      throw NetworkException(
        'Invalid JSON format',
        statusCode: response.statusCode,
      );
    }

    if (jsonResponse is! Map<String, dynamic>) {
      throw NetworkException(
        'Unexpected response format',
        statusCode: response.statusCode,
        data: jsonResponse,
      );
    }

    final responseCode = jsonResponse[_responseCodeKey]?.toString();
    final responseMessage =
        jsonResponse[_responseMessageKey]?.toString() ?? 'Unknown error';

    // Base logic entirely on responseCode, not HTTP status
    if (responseCode == _successCode) {
      return jsonResponse;
    } else {
      final exception = NetworkException(
        responseMessage,
        statusCode: response.statusCode,
        responseCode: responseCode,
        data: jsonResponse,
      );

      // Handle known response codes (unauthorized, update required, etc.)
      _handleSpecificResponseCode(exception);

      // Throw to let controller handle it
      throw exception;
    }
  }

  /// Handle specific response codes with custom actions
  void _handleSpecificResponseCode(NetworkException exception) {
    Logger().i("Handle specific Response ::: ${exception.responseCode}");
    switch (exception.responseCode) {
      case ResponseCodes.unauthorized:
      case ResponseCodes.authFailed:
        clearAuthToken();
        if (onUnauthorized != null) {
          onUnauthorized!(exception);
        } else {
          Get.offAllNamed('/login');
        }
        break;

      case ResponseCodes.appUpdateRequired:
        if (onAppUpdateRequired != null) {
          onAppUpdateRequired!(exception);
        } else {
          _showUpdateDialog();
        }
        break;

      case ResponseCodes.accessDenied:
        if (onAccessDenied != null) {
          onAccessDenied!(exception);
        }
        break;

      case ResponseCodes.rateLimitExceeded:
        Get.snackbar(
          'Rate Limit',
          exception.message,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5),
        );
        break;
    }
  }

  /// Show app update dialog
  void _showUpdateDialog() {
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: const Text('Update Required'),
          content: const Text(
            'Please update your app to continue using our services.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                // TODO: Open app store/play store
                // You can use url_launcher package
              },
              child: const Text('Update Now'),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  /// Handle errors
  void _handleError(dynamic error) {
    if (error is SocketException) {
      throw NetworkException('No internet connection');
    } else if (error is HttpException) {
      throw NetworkException('HTTP error occurred');
    } else if (error is FormatException) {
      throw NetworkException('Invalid response format');
    } else if (error is NetworkException) {
      throw error;
    } else {
      throw NetworkException('Unexpected error: ${error.toString()}');
    }
  }

  /// Show error snackbar
  void _showError(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
    );
  }

  /// GET request
  Future<dynamic> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    bool showLoading = false,
    bool showError = true,
  }) async {
    try {
      if (showLoading) isLoading.value = true;

      Uri uri = Uri.parse(_buildUrl(endpoint));
      if (queryParams != null) {
        uri = uri.replace(queryParameters: queryParams);
      }
      Logger().d('GET:: $uri\nHeaders: ${_mergeHeaders(headers)}');

      final response = await http
          .get(uri, headers: _mergeHeaders(headers))
          .timeout(_timeout);

      return _handleResponse(response);
    } catch (e) {
      if (showError && e is NetworkException) _showError(e.message);
      return _handleError(e);
    } finally {
      if (showLoading) isLoading.value = false;
    }
  }

  /// POST request
  Future<dynamic> post(
    String endpoint, {
    dynamic body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    bool showLoading = false,
    bool showError = true,
  }) async {
    try {
      if (showLoading) isLoading.value = true;

      Uri uri = Uri.parse(_buildUrl(endpoint));
      if (queryParams != null) {
        uri = uri.replace(queryParameters: queryParams);
      }

      final response = await http
          .post(
            uri,
            headers: _mergeHeaders(headers),
            body: body != null ? json.encode(body) : null,
          )
          .timeout(_timeout);
      Logger().d(
        'POST $uri\nHeaders: ${_mergeHeaders(headers)}\nBody: $body\nResponse: ${response.body}',
      );

      return _handleResponse(response);
    } catch (e) {
      if (showError && e is NetworkException) _showError(e.message);
      return _handleError(e);
    } finally {
      if (showLoading) isLoading.value = false;
    }
  }

  /// PUT request
  Future<dynamic> put(
    String endpoint, {
    dynamic body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    bool showLoading = false,
    bool showError = true,
  }) async {
    try {
      if (showLoading) isLoading.value = true;

      Uri uri = Uri.parse(_buildUrl(endpoint));
      if (queryParams != null) {
        uri = uri.replace(queryParameters: queryParams);
      }

      final response = await http
          .put(
            uri,
            headers: _mergeHeaders(headers),
            body: body != null ? json.encode(body) : null,
          )
          .timeout(_timeout);

      return _handleResponse(response);
    } catch (e) {
      if (showError && e is NetworkException) _showError(e.message);
      return _handleError(e);
    } finally {
      if (showLoading) isLoading.value = false;
    }
  }

  /// PATCH request
  Future<dynamic> patch(
    String endpoint, {
    dynamic body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    bool showLoading = false,
    bool showError = true,
  }) async {
    try {
      if (showLoading) isLoading.value = true;

      Uri uri = Uri.parse(_buildUrl(endpoint));
      if (queryParams != null) {
        uri = uri.replace(queryParameters: queryParams);
      }

      final response = await http
          .patch(
            uri,
            headers: _mergeHeaders(headers),
            body: body != null ? json.encode(body) : null,
          )
          .timeout(_timeout);

      return _handleResponse(response);
    } catch (e) {
      if (showError && e is NetworkException) _showError(e.message);
      return _handleError(e);
    } finally {
      if (showLoading) isLoading.value = false;
    }
  }

  /// DELETE request
  Future<dynamic> delete(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    dynamic body,
    bool showLoading = false,
    bool showError = true,
  }) async {
    try {
      if (showLoading) isLoading.value = true;

      Uri uri = Uri.parse(_buildUrl(endpoint));
      if (queryParams != null) {
        uri = uri.replace(queryParameters: queryParams);
      }

      final response = await http
          .delete(
            uri,
            headers: _mergeHeaders(headers),
            body: body != null ? json.encode(body) : null,
          )
          .timeout(_timeout);

      return _handleResponse(response);
    } catch (e) {
      if (showError && e is NetworkException) _showError(e.message);
      return _handleError(e);
    } finally {
      if (showLoading) isLoading.value = false;
    }
  }

  /// Multipart request (for file uploads)
  Future<dynamic> uploadFile(
    String endpoint, {
    required File file,
    required String fileKey,
    Map<String, String>? fields,
    Map<String, String>? headers,
    bool showLoading = false,
    bool showError = true,
  }) async {
    try {
      if (showLoading) isLoading.value = true;

      final uri = Uri.parse(_buildUrl(endpoint));
      final request = http.MultipartRequest('POST', uri);

      request.headers.addAll(_mergeHeaders(headers));
      request.files.add(await http.MultipartFile.fromPath(fileKey, file.path));

      if (fields != null) {
        request.fields.addAll(fields);
      }

      final streamedResponse = await request.send().timeout(_timeout);
      final response = await http.Response.fromStream(streamedResponse);

      return _handleResponse(response);
    } catch (e) {
      if (showError && e is NetworkException) _showError(e.message);
      return _handleError(e);
    } finally {
      if (showLoading) isLoading.value = false;
    }
  }

  /// Download file
  // Future<File> downloadFile(
  //   String endpoint,
  //   String savePath, {
  //   Map<String, String>? headers,
  //   bool showLoading = false,
  //   bool showError = true,
  // }) async {
  //   try {
  //     if (showLoading) isLoading.value = true;

  //     final uri = Uri.parse(_buildUrl(endpoint));
  //     final response = await http
  //         .get(uri, headers: _mergeHeaders(headers))
  //         .timeout(_timeout);

  //     if (response.statusCode >= 200 && response.statusCode < 300) {
  //       final file = File(savePath);
  //       await file.writeAsBytes(response.bodyBytes);
  //       return file;
  //     } else {
  //       throw NetworkException(
  //         'Failed to download file ${response.statusCode}',
  //       );
  //     }
  //   } catch (e) {
  //     if (showError && e is NetworkException) _showError(e.message);
  //     return _handleError(e);
  //   } finally {
  //     if (showLoading) isLoading.value = false;
  //   }
  // }
}

// Example Controller using NetworkService with all response codes
/*
class AuthController extends GetxController {
  final isLoggedIn = false.obs;

  Future<void> login(String email, String password) async {
    try {
      final response = await NetworkService.to.post(
        '/login',
        body: {'email': email, 'password': password},
        showLoading: true,
      );
      
      // Only reaches here if responseCode == '000'
      final token = response['tokenResponse'];
      NetworkService.to.setAuthToken(token);
      isLoggedIn.value = true;
      Get.offAllNamed('/home');
      
    } on NetworkException catch (e) {
      // Specific error handling based on response code
      switch (e.responseCode) {
        case ResponseCodes.unauthorized:
        case ResponseCodes.authFailed:
          Get.snackbar('Login Failed', 'Invalid credentials');
          break;
          
        case ResponseCodes.accessDenied:
          Get.snackbar('Access Denied', e.message);
          break;
          
        case ResponseCodes.rateLimitExceeded:
          // Already handled by NetworkService
          break;
          
        case ResponseCodes.appUpdateRequired:
          // Already handled by NetworkService (shows dialog)
          break;
          
        case ResponseCodes.userCreationFailed:
          Get.snackbar('Error', 'Failed to create user account');
          break;
          
        case ResponseCodes.notFound:
          Get.snackbar('Not Found', 'User account not found');
          break;
          
        case ResponseCodes.badRequest:
          Get.snackbar('Invalid Input', e.message);
          break;
          
        case ResponseCodes.internalServerError:
          Get.snackbar('Server Error', 'Please try again later');
          break;
          
        default:
          Get.snackbar('Error', e.message);
      }
      
      // Or use helper methods
      if (e.isUnauthorized) {
        // Handle unauthorized
      }
      if (e.isUpdateRequired) {
        // Handle update required
      }
    }
  }

  Future<void> fetchUserData() async {
    try {
      final response = await NetworkService.to.get('/user/profile');
      // Process response...
    } on NetworkException catch (e) {
      if (e.isNotFound) {
        Get.snackbar('Profile Not Found', 'Please complete your profile');
      } else {
        Get.snackbar('Error', e.message);
      }
    }
  }
}

class TransactionController extends GetxController {
  Future<void> makePayment(Map<String, dynamic> data) async {
    try {
      final response = await NetworkService.to.post(
        '/transaction',
        body: data,
        showLoading: true,
      );
      
      Get.snackbar('Success', 'Payment completed successfully');
      
    } on NetworkException catch (e) {
      if (e.responseCode == ResponseCodes.transactionFailed) {
        Get.snackbar('Transaction Failed', e.message);
      } else if (e.responseCode == ResponseCodes.forbidden) {
        Get.snackbar('Forbidden', 'You cannot perform this transaction');
      } else {
        Get.snackbar('Error', e.message);
      }
    }
  }
}
*/

// Initialize in main.dart with custom callbacks:
/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Get.putAsync(() => NetworkService().init(
    baseUrl: 'https://api.example.com',
    timeout: Duration(seconds: 30),
    successCode: ResponseCodes.success,
    responseCodeKey: 'responseCode',
    responseMessageKey: 'responseDescription',
    // Custom callbacks for specific response codes
    onUnauthorized: (exception) {
      // Custom unauthorized handling
      Get.offAllNamed('/login');
      Get.snackbar('Session Expired', 'Please login again');
    },
    onAppUpdateRequired: (exception) {
      // Custom app update handling
      // Open app store/play store
    },
    onAccessDenied: (exception) {
      // Custom access denied handling
      Get.snackbar('Access Denied', exception.message);
    },
  ));
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
      ],
    );
  }
}
*/
