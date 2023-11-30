import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multistorex_mobileapp_/apps/app_locationzaltion.dart';
import 'package:multistorex_mobileapp_/consantnames.dart';
import 'package:multistorex_mobileapp_/widgits/customtextstyle.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({Key? key}) : super(key: key);

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height;
    double containerWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: containerHeight,
              decoration:
                  BoxDecoration(color: Color.fromRGBO(187, 187, 187, 0.4)),
              child: Image.asset(
                "Assets/Images/Onboarding.png", // Make sure the path is correct
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                  width: containerWidth,
                  height: containerHeight * 0.3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0),
                        Color.fromRGBO(246, 197, 123, 1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 28.0, top: 50.0, right: 28.0),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .getTranslatedValue('welcome_to'),
                            style: FontUtils.getfontStyle(
                              color: Color.fromRGBO(17, 17, 17, 1),
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              letterSpacing: 0.0,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                AppConstants.appName,
                                style: FontUtils.getfontStyle(
                                  color: Color.fromRGBO(17, 17, 17, 1),
                                  fontSize: 49.0,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                  letterSpacing: 0.0,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              GestureDetector(
                                child: Container(
                                    child: SvgPicture.asset(
                                  'Assets/Icon/arrow.svg',
                                  height: 41.0,
                                  width: 32.0,
                                )),
                              ),
                            ],
                          ),
                          Container(
                            width: containerWidth * 0.9,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text(
                                AppLocalizations.of(context)!
                                    .getTranslatedValue('skip'),
                                textAlign: TextAlign.right,
                                style: FontUtils.getfontStyle(
                                  color: Color.fromRGBO(17, 17, 17, 1),
                                  fontSize: 16.0,
                                  height: 1.2,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
