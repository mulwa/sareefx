import 'package:get/get.dart';

class SareefConfig extends GetxService {
  late SareefValues values;

  Future<SareefConfig> init(SareefValues newValues) async {
    values = newValues;
    return this;
  }
}

class SareefValues {
  final String urlScheme;
  final String baseDomain;
  final String hiveBoxKey;
  final String hiveBoxEncryptionKey;
  final String globalEncryptionKey;
  final BuildFlavour buildFlavour;

  const SareefValues({
    required this.urlScheme,
    required this.baseDomain,
    required this.hiveBoxKey,
    required this.hiveBoxEncryptionKey,
    required this.globalEncryptionKey,
    required this.buildFlavour,
  });
}

enum BuildFlavour { development, staging, production }
