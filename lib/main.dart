import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multistorex_mobileapp_/Routes.dart';
import 'package:multistorex_mobileapp_/Screens/Categoryscreen.dart';
import 'package:multistorex_mobileapp_/Screens/Loginpage.dart';
import 'package:multistorex_mobileapp_/Screens/Onboadringscreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multistorex_mobileapp_/Screens/forgotpassword.dart';
import 'package:multistorex_mobileapp_/Screens/homepage.dart';
import 'package:multistorex_mobileapp_/Screens/signuppage.dart';
import 'package:multistorex_mobileapp_/apps/app_locationzaltion.dart';
import 'package:multistorex_mobileapp_/cubit/Homecubit.dart';
import 'package:multistorex_mobileapp_/cubit/categorycubit.dart';
import 'package:multistorex_mobileapp_/cubit/subcategorycubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => SubcategoryCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
        initialRoute: MyRoutes.Categoryscreen,
        routes: {
          MyRoutes.walkthrough: (context) => const Onboardingscreen(),
          MyRoutes.login: (context) => const loginpage(),
          MyRoutes.register: (context) => const Signuppage(),
          MyRoutes.forgotPassword: (context) => const Forgotpasswordpage(),
          MyRoutes.home: (context) => const Homepage(),
          MyRoutes.Categoryscreen: (context) => Categoryscreen(),
        },
      ),
    );
  }
}
