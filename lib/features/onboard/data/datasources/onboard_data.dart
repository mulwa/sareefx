import 'package:sareefx/features/onboard/data/models/onboard_model.dart';

final _calm = OnboardModel(
  title: 'Stay calm and\ntrade smart',
  description:
      'A new way to manage and trade all your\ncurrency easily and fastest '
      'in the\nmarket',
);

final _sharp = OnboardModel(
  title: 'Stay sharp,\nStay ahead',
  description:
      'Be ahead of the game with latest\nmarket trends for your exchange '
      'rate\nand currencies',
);

final _deposits = OnboardModel(
  title: 'Simple Deposits &\nWithdrawals',
  description:
      'Make simple withdrawals and deposits\nanywhere and anytime via our '
      'SareeFX\nApplication',
);

final _welcome = OnboardModel(
  title: 'Welcome to\nSareeFX ',
  description:
      'Access all your trading, wallet, FX\nexchange and many more on '
      'our\nplatform',
);

final List<OnboardModel> onboardViews = [_calm, _sharp, _deposits, _welcome];
