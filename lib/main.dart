import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sareefx/l10n/arb/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sareefx/utils/core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      initialRoute: AppRouter.onboardRoute,
      onGenerateRoute: AppRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
