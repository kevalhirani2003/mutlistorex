import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multistorex_mobileapp_/Routes.dart';
import 'package:multistorex_mobileapp_/Screens/Categoryscreen.dart';
import 'package:multistorex_mobileapp_/Screens/Faqscreen.dart';
import 'package:multistorex_mobileapp_/Screens/Loginpage.dart';
import 'package:multistorex_mobileapp_/Screens/Manageaddress.dart';
import 'package:multistorex_mobileapp_/Screens/Onboadringscreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multistorex_mobileapp_/Screens/SupportScreen.dart';
import 'package:multistorex_mobileapp_/Screens/aboutusscreen.dart';
import 'package:multistorex_mobileapp_/Screens/addnewaddresspage.dart';
import 'package:multistorex_mobileapp_/Screens/forgotpassword.dart';
import 'package:multistorex_mobileapp_/Screens/homepage.dart';
import 'package:multistorex_mobileapp_/Screens/shipingpolicypage.dart';
import 'package:multistorex_mobileapp_/Screens/signuppage.dart';
import 'package:multistorex_mobileapp_/apps/app_locationzaltion.dart';
import 'package:multistorex_mobileapp_/cubit/Homecubit.dart';
import 'package:multistorex_mobileapp_/cubit/addresscubit.dart';
import 'package:multistorex_mobileapp_/cubit/categorycubit.dart';
import 'package:multistorex_mobileapp_/cubit/subcategorycubit.dart';
import 'package:multistorex_mobileapp_/Screens/Activitypage.dart';
import 'package:multistorex_mobileapp_/cubit/usercubit.dart';

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
        BlocProvider(create: (context) => ManageAddressCubit()),
        BlocProvider(create: (context) => UserInfoCubit()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => SubcategoryCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
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
        supportedLocales: const [
          Locale(
            'en',
          ), // English
          Locale('ar'), // arabic
          Locale('hi') // Hindi
        ],
        initialRoute: MyRoutes.walkthrough,
        routes: {
          MyRoutes.walkthrough: (context) => const Onboardingscreen(),
          MyRoutes.login: (context) => const loginpage(),
          MyRoutes.register: (context) => const Signuppage(),
          MyRoutes.forgotPassword: (context) => const Forgotpasswordpage(),
          MyRoutes.home: (context) => const Homepage(),
          MyRoutes.Categoryscreen: (context) => const Categoryscreen(),
          MyRoutes.activityscreen: (context) => const Myactivitypage(),
          MyRoutes.aboutusscreen: (context) => const aboutusscreen(),
          MyRoutes.FAQscreen: (context) => FAQscreen(),
          MyRoutes.Supportscreen: (context) => SupportScreen(),
          MyRoutes.shipingandreturnpolicysscreen: (context) =>
              const shipingscren(),
          MyRoutes.Addaddressscreen: (context) => const addnewaddressscreen(),
          MyRoutes.Manageaddressscreen: (context) => const ManageAddress(),
        },
      ),
    );
  }
}
