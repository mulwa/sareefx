import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sareefx/data/secure_storage.dart';
import 'package:sareefx/features/controllers/authentication_controller.dart';
import 'package:sareefx/features/controllers/kyc_controller.dart';
import 'package:sareefx/l10n/arb/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sareefx/utils/core.dart' hide BuildFlavour;
import 'package:sareefx/utils/network_service.dart';
import 'package:sareefx/utils/sareef_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 👇 Detect build flavour using dart-define (e.g. FLAVOUR=staging)
  const flavour = String.fromEnvironment(
    'FLAVOUR',
    defaultValue: 'development',
  );

  // 👇 Initialize SareefConfig through GetX
  await Get.putAsync<SareefConfig>(() async {
    final config = SareefConfig();

    late SareefValues values;
    switch (flavour) {
      case 'production':
        values = SareefValues(
          urlScheme: 'https',
          baseDomain: 'p2p.remitxpress.com',
          hiveBoxKey: 'sareef_production',
          hiveBoxEncryptionKey: 'PRODUCTION_KEY_HERE',
          globalEncryptionKey: 'AWpFNsyWia7u83kCwfmt3vG6t1RTFcdo',
          buildFlavour: BuildFlavour.production,
        );
        break;

      case 'staging':
        values = const SareefValues(
          urlScheme: 'https',
          baseDomain: 'staging.remitxpress.com',
          hiveBoxKey: 'sareef_staging',
          hiveBoxEncryptionKey: 'STAGING_KEY_HERE',
          globalEncryptionKey: 'AWpFNsyWia7u83kCwfmt3vG6t1RTFcdo',
          buildFlavour: BuildFlavour.staging,
        );
        break;

      default:
        values = SareefValues(
          urlScheme: 'https',
          baseDomain: 'p2p.remitxpress.com',
          hiveBoxKey: 'sareef_development',
          hiveBoxEncryptionKey: 'DEV_KEY_HERE',
          globalEncryptionKey: 'AWpFNsyWia7u83kCwfmt3vG6t1RTFcdo',
          buildFlavour: BuildFlavour.development,
        );
        break;
    }

    return await config.init(values);
  });
  await Get.putAsync(
    () => NetworkService().init(
      baseUrl: 'http://196.188.172.182:9000',
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
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.find<SareefConfig>();

    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'SareefX (${config.values.buildFlavour.name})',
          initialBinding: BindingsBuilder(() {
            final storage = SecureStorageServiceImpl();
            Get.put(KYCController());
            Get.put(AuthController(storage));
          }),
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            useMaterial3: true,
            fontFamily: GoogleFonts.manrope().fontFamily,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.manropeTextTheme(
              const TextTheme().apply(fontSizeFactor: 0.9),
            ),
            scaffoldBackgroundColor: AppColors.white,
          ),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          initialRoute: AppRoutes.onboard,
          getPages: AppPages.pages,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
