class WalletTransactionModel {
  String? responseCode;
  String? responseDescription;
  List<WalletTransaction>? walletTransaction;
  Null? metadata;

  WalletTransactionModel({
    this.responseCode,
    this.responseDescription,
    this.walletTransaction,
    this.metadata,
  });

  WalletTransactionModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseDescription = json['responseDescription'];
    if (json['data'] != null) {
      walletTransaction = <WalletTransaction>[];
      json['data'].forEach((v) {
        walletTransaction!.add(new WalletTransaction.fromJson(v));
      });
    }
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['responseDescription'] = this.responseDescription;
    if (this.walletTransaction != null) {
      data['WalletTransaction'] = this.walletTransaction!
          .map((v) => v.toJson())
          .toList();
    }
    data['metadata'] = this.metadata;
    return data;
  }
}

class WalletTransaction {
  int? transactionId;
  int? walletId;
  double? amount;
  int? transactionType;
  String? referenceId;
  int? status;
  String? description;
  String? createdAt;
  String? completedAt;

  WalletTransaction({
    this.transactionId,
    this.walletId,
    this.amount,
    this.transactionType,
    this.referenceId,
    this.status,
    this.description,
    this.createdAt,
    this.completedAt,
  });

  WalletTransaction.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    walletId = json['walletId'];
    amount = json['amount'];
    transactionType = json['transactionType'];
    referenceId = json['referenceId'];
    status = json['status'];
    description = json['description'];
    createdAt = json['createdAt'];
    completedAt = json['completedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactionId'] = this.transactionId;
    data['walletId'] = this.walletId;
    data['amount'] = this.amount;
    data['transactionType'] = this.transactionType;
    data['referenceId'] = this.referenceId;
    data['status'] = this.status;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['completedAt'] = this.completedAt;
    return data;
  }
}
