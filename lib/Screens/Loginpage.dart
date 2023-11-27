import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multistorex_mobileapp_/apps/app_locationzaltion.dart';
import 'package:multistorex_mobileapp_/consantnames.dart';
import 'package:multistorex_mobileapp_/widgits/animation/customsildinganimation.dart';

class loginpage extends StatelessWidget {
  const loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height;
    double containerWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Stack(
          children: [
            Stack(
              children: [
                Container(
                  height: containerHeight,
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(187, 187, 187, 0.4)),
                  child: Image.asset(
                    "Assets/Onboarding.png", // Make sure the path is correct
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
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 34.0,
                                  fontWeight: FontWeight.w400,
                                  height:
                                      1.2, // Calculated as line-height/font-size
                                  letterSpacing: 0.0,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    AppConstants.appName,
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontSize: 49.0,
                                      fontWeight: FontWeight.w600,
                                      height:
                                          1.37, // Calculated as line-height/font-size
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  GestureDetector(
                                    child: Container(
                                        child: SvgPicture.asset(
                                      'Assets/arrow.svg',
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
            Positioned(
                bottom: 0,
                child: Container(
                    height: containerHeight * 1,
                    width: containerWidth,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(187, 187, 187, 0.4),
                    ))),
          ],
        ),
        Positioned(
          bottom: 0,
          child: SlidingContainer(
            child: Container(
                height: containerHeight * 0.5,
                width: containerWidth,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 239, 228, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!
                          .getTranslatedValue('welcome_to'),
                      style: TextStyle(
                        color: Color.fromRGBO(17, 17, 17, 1),
                        fontFamily: 'Inter',
                        fontSize: 27.0,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        letterSpacing: 0.0,
                      ),
                    ),
                    Text(
                      AppConstants.appName,
                      style: TextStyle(
                        color: Color.fromRGBO(17, 17, 17, 1),
                        fontFamily: 'Inter',
                        fontSize: 39.0,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        letterSpacing: 0.0,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!
                          .getTranslatedValue('Enter_your' + "phone_number"),
                      style: TextStyle(
                        color: Color.fromRGBO(17, 17, 17, 1),
                        fontFamily: 'Inter',
                        fontSize: 27.0,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ],
                )),
            duration: Duration(seconds: 1),
            beginOffset: Offset(0.0, 1.0),
            endOffset: Offset(0.0, 0.0),
          ),
        )
      ]),
    );
  }
}
