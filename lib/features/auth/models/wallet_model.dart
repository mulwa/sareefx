class UserWalletModel {
  String? responseCode;
  String? responseDescription;
  List<Wallet>? wallet;
  Null? metadata;

  UserWalletModel({
    this.responseCode,
    this.responseDescription,
    this.wallet,
    this.metadata,
  });

  UserWalletModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseDescription = json['responseDescription'];
    if (json['data'] != null) {
      wallet = <Wallet>[];
      json['data'].forEach((v) {
        wallet!.add(Wallet.fromJson(v));
      });
    }
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['responseDescription'] = this.responseDescription;
    if (this.wallet != null) {
      data['data'] = this.wallet!.map((v) => v.toJson()).toList();
    }
    data['metadata'] = this.metadata;
    return data;
  }
}

class Wallet {
  int? walletId;
  int? accountNumber;
  String? currency;
  double? availableBalance;
  double? inOrderBalance;
  double? totalBalance;
  String? lastUpdated;
  int? userId;

  Wallet({
    this.walletId,
    this.accountNumber,
    this.currency,
    this.availableBalance,
    this.inOrderBalance,
    this.totalBalance,
    this.lastUpdated,
    this.userId,
  });

  Wallet.fromJson(Map<String, dynamic> json) {
    walletId = json['walletId'];
    accountNumber = json['accountNumber'];
    currency = json['currency'];
    availableBalance = json['availableBalance'];
    inOrderBalance = json['inOrderBalance'];
    totalBalance = json['totalBalance'];
    lastUpdated = json['lastUpdated'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['walletId'] = this.walletId;
    data['accountNumber'] = this.accountNumber;
    data['currency'] = this.currency;
    data['availableBalance'] = this.availableBalance;
    data['inOrderBalance'] = this.inOrderBalance;
    data['totalBalance'] = this.totalBalance;
    data['lastUpdated'] = this.lastUpdated;
    data['userId'] = this.userId;
    return data;
  }
}
