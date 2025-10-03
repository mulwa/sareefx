enum TimeSlot {
  nineAm,
  twelvePm,
  threePm,
  fivePm;

  @override
  String toString() {
    switch (this) {
      case TimeSlot.nineAm:
        return '9:00 AM';
      case TimeSlot.twelvePm:
        return '12:00 PM';
      case TimeSlot.threePm:
        return '3:00 PM';
      case TimeSlot.fivePm:
        return '5:00 PM';
    }
  }
}

enum BuildFlavour {
  development,
  staging,
  production;

  @override
  String toString() {
    switch (this) {
      case BuildFlavour.development:
        return 'development';
      case BuildFlavour.staging:
        return 'staging';
      case BuildFlavour.production:
        return 'production';
    }
  }
}

enum Language {
  english,
  swahili;

  @override
  String toString() {
    switch (this) {
      case Language.english:
        return 'en';
      case Language.swahili:
        return 'sw';
    }
  }
}

enum ResponseCode {
  success('000'),
  missingPlatform('001'),
  invalidPlatform('002'),
  missingAppVersion('003'),
  appUpdateRequired('004'),
  unauthorized('005'),
  accessDenied('006'),
  rateLimitExceeded('007'),
  userCreationFailed('008'),
  notFound('009'),
  authFailed('010'),
  transactionFailed('011'),
  forbidden('012'),
  internalServerError('999');

  const ResponseCode(this.code);
  final String code;
}
