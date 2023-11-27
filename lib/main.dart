import 'package:flutter/material.dart';
import 'package:multistorex_mobileapp_/Routes.dart';
import 'package:multistorex_mobileapp_/Screens/Loginpage.dart';
import 'package:multistorex_mobileapp_/Screens/Onboadringscreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multistorex_mobileapp_/apps/app_locationzaltion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).colorScheme.background == Colors.white
          ? ThemeData.light()
          : ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: myRoutes.walkthrough,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      supportedLocales: [
        Locale(
          'en',
        ), // English
        Locale('ar'), // arabic
        Locale('hi') // Hindi
      ],
      routes: {
        myRoutes.walkthrough: (context) => const Onboardingscreen(),
        myRoutes.login: (context) => const loginpage(),
      },
    );
  }
}
