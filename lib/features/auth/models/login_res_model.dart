class LoginResModel {
  String? responseDescription;
  String? responseCode;
  String? userId;
  String? name;
  String? userType;
  int? pinAttempts;
  bool? deviceMatched;
  bool? changePin;
  TokenResponse? tokenResponse;

  LoginResModel({
    this.responseDescription,
    this.responseCode,
    this.userId,
    this.name,
    this.userType,
    this.pinAttempts,
    this.deviceMatched,
    this.changePin,
    this.tokenResponse,
  });

  LoginResModel.fromJson(Map<String, dynamic> json) {
    responseDescription = json['responseDescription'];
    responseCode = json['responseCode'];
    userId = json['userId'];
    name = json['name'];
    userType = json['userType'];
    pinAttempts = json['pinAttempts'];
    deviceMatched = json['deviceMatched'];
    changePin = json['changePin'];
    tokenResponse = json['tokenResponse'] != null
        ? new TokenResponse.fromJson(json['tokenResponse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseDescription'] = this.responseDescription;
    data['responseCode'] = this.responseCode;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['userType'] = this.userType;
    data['pinAttempts'] = this.pinAttempts;
    data['deviceMatched'] = this.deviceMatched;
    data['changePin'] = this.changePin;
    if (this.tokenResponse != null) {
      data['tokenResponse'] = this.tokenResponse!.toJson();
    }
    return data;
  }
}

class TokenResponse {
  String? accessToken;
  String? refreshToken;
  String? tokenType;
  String? expiresIn;
  String? refreshExpiresIn;
  Null? error;

  TokenResponse({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
    this.refreshExpiresIn,
    this.error,
  });

  TokenResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    tokenType = json['tokenType'];
    expiresIn = json['expiresIn'];
    refreshExpiresIn = json['refreshExpiresIn'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    data['tokenType'] = this.tokenType;
    data['expiresIn'] = this.expiresIn;
    data['refreshExpiresIn'] = this.refreshExpiresIn;
    data['error'] = this.error;
    return data;
  }
}
