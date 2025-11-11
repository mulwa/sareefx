class ExchangeResModel {
  String? responseCode;
  String? responseDescription;
  List<ExchangeModel>? exchangeModel;
  Null? metadata;

  ExchangeResModel({
    this.responseCode,
    this.responseDescription,
    this.exchangeModel,
    this.metadata,
  });

  ExchangeResModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseDescription = json['responseDescription'];
    if (json['data'] != null) {
      exchangeModel = <ExchangeModel>[];
      json['data'].forEach((v) {
        exchangeModel!.add(new ExchangeModel.fromJson(v));
      });
    }
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['responseDescription'] = this.responseDescription;
    if (this.exchangeModel != null) {
      data['ExchangeModel'] = this.exchangeModel!
          .map((v) => v.toJson())
          .toList();
    }
    data['metadata'] = this.metadata;
    return data;
  }
}

class ExchangeModel {
  int? offerId;
  double? exchangeRate;
  double? minAmount;
  double? maxAmount;
  double? availableAmount;
  String? fromCurrency;
  String? toCurrency;
  String? terms;
  int? status;
  double? commissionRate;
  String? createdAt;
  String? lastUpdated;
  String? userUUID;
  User? user;
  List<PaymentMethods>? paymentMethods;

  ExchangeModel({
    this.offerId,
    this.exchangeRate,
    this.minAmount,
    this.maxAmount,
    this.availableAmount,
    this.fromCurrency,
    this.toCurrency,
    this.terms,
    this.status,
    this.commissionRate,
    this.createdAt,
    this.lastUpdated,
    this.userUUID,
    this.user,
    this.paymentMethods,
  });

  ExchangeModel.fromJson(Map<String, dynamic> json) {
    offerId = json['offerId'];
    exchangeRate = json['exchangeRate'];
    minAmount = json['minAmount'];
    maxAmount = json['maxAmount'];
    availableAmount = json['availableAmount'];
    fromCurrency = json['fromCurrency'];
    toCurrency = json['toCurrency'];
    terms = json['terms'];
    status = json['status'];
    commissionRate = json['commissionRate'];
    createdAt = json['createdAt'];
    lastUpdated = json['lastUpdated'];
    userUUID = json['userUUID'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['paymentMethods'] != null) {
      paymentMethods = <PaymentMethods>[];
      json['paymentMethods'].forEach((v) {
        paymentMethods!.add(new PaymentMethods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offerId'] = this.offerId;
    data['exchangeRate'] = this.exchangeRate;
    data['minAmount'] = this.minAmount;
    data['maxAmount'] = this.maxAmount;
    data['availableAmount'] = this.availableAmount;
    data['fromCurrency'] = this.fromCurrency;
    data['toCurrency'] = this.toCurrency;
    data['terms'] = this.terms;
    data['status'] = this.status;
    data['commissionRate'] = this.commissionRate;
    data['createdAt'] = this.createdAt;
    data['lastUpdated'] = this.lastUpdated;
    data['userUUID'] = this.userUUID;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.paymentMethods != null) {
      data['paymentMethods'] = this.paymentMethods!
          .map((v) => v.toJson())
          .toList();
    }
    return data;
  }
}

class User {
  int? userId;
  String? username;
  String? firstName;
  String? lastName;
  String? countryCode;

  User({
    this.userId,
    this.username,
    this.firstName,
    this.lastName,
    this.countryCode,
  });

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    countryCode = json['countryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['username'] = this.username;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['countryCode'] = this.countryCode;
    return data;
  }
}

class PaymentMethods {
  int? paymentMethodId;
  String? paymentMethod;
  String? paymentMethodDescription;

  PaymentMethods({
    this.paymentMethodId,
    this.paymentMethod,
    this.paymentMethodDescription,
  });

  PaymentMethods.fromJson(Map<String, dynamic> json) {
    paymentMethodId = json['paymentMethodId'];
    paymentMethod = json['paymentMethod'];
    paymentMethodDescription = json['paymentMethodDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paymentMethodId'] = this.paymentMethodId;
    data['paymentMethod'] = this.paymentMethod;
    data['paymentMethodDescription'] = this.paymentMethodDescription;
    return data;
  }
}
