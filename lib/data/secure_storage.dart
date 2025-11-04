import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sareefx/utils/constants/enums.dart'; // for Language, UserDetailsDto

abstract class SecureStorageService {
  Future<void> persistToken(String token);
  Future<String?> retrieveToken();

  Future<void> persistLanguage(Language language);
  Future<Language?> retrieveLanguage();

  Future<void> persistEmail(String email);
  Future<String?> retrieveEmail();

  Future<void> persistNotificationStatus({required bool hasSubscribed});
  Future<bool?> retrieveNotificationStatus();

  Future<void> persistUserId(String userId);
  Future<String?> retrieveUserId();

  // Future<void> persistUserDetails(UserDetailsDto user);
  // Future<UserDetailsDto?> retrieveUserDetails();

  Future<void> clearAll();
}

class SecureStorageServiceImpl implements SecureStorageService {
  final _storage = const FlutterSecureStorage();

  // Define keys
  static const _tokenKey = 'accessToken';
  static const _emailKey = 'email';
  static const _languageKey = 'language';
  static const _notifKey = 'notificationStatus';
  static const _userDetailsKey = 'userDetails';
  static const _userId = 'userId';

  @override
  Future<void> persistToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> retrieveToken() => _storage.read(key: _tokenKey);

  @override
  Future<void> persistLanguage(Language language) async {
    await _storage.write(key: _languageKey, value: language.name);
  }

  @override
  Future<Language?> retrieveLanguage() async {
    final lang = await _storage.read(key: _languageKey);
    if (lang == null) return null;
    return Language.values.firstWhere(
      (e) => e.name == lang,
      orElse: () => Language.english,
    );
  }

  @override
  Future<void> persistEmail(String email) async {
    await _storage.write(key: _emailKey, value: email);
  }

  @override
  Future<String?> retrieveEmail() => _storage.read(key: _emailKey);

  @override
  Future<void> persistNotificationStatus({required bool hasSubscribed}) async {
    await _storage.write(key: _notifKey, value: hasSubscribed.toString());
  }

  @override
  Future<bool?> retrieveNotificationStatus() async {
    final value = await _storage.read(key: _notifKey);
    if (value == null) return null;
    return value.toLowerCase() == 'true';
  }

  // @override
  // Future<void> persistUserDetails(UserDetailsDto user) async {
  //   await _storage.write(key: _userDetailsKey, value: jsonEncode(user.toJson()));
  // }

  // @override
  // Future<UserDetailsDto?> retrieveUserDetails() async {
  //   final jsonString = await _storage.read(key: _userDetailsKey);
  //   if (jsonString == null) return null;
  //   return UserDetailsDto.fromJson(jsonDecode(jsonString));
  // }

  @override
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  @override
  Future<void> persistUserId(String token) async {
    await _storage.write(key: _userId, value: token);
  }

  @override
  Future<String?> retrieveUserId() => _storage.read(key: _userId);
}
