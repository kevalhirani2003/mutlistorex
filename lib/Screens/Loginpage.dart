import 'package:flutter/material.dart';
import 'package:multistorex_mobileapp_/apps/app_locationzaltion.dart';
import 'package:multistorex_mobileapp_/consantnames.dart';
import 'package:multistorex_mobileapp_/widgits/Validation.dart';
import 'package:multistorex_mobileapp_/widgits/animation/customsildinganimation.dart';
import 'package:multistorex_mobileapp_/widgits/custombutton.dart';
import 'package:multistorex_mobileapp_/widgits/customtextfield.dart';
import 'package:multistorex_mobileapp_/widgits/customtextstyle.dart';
import 'package:multistorex_mobileapp_/widgits/onboardingscreen.dart';

class loginpage extends StatelessWidget {
  const loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    double containerHeight = MediaQuery.of(context).size.height;
    double containerWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(children: [
        WelcomeStack(
          containerHeight: containerHeight,
          containerWidth: containerWidth,
        ),
        Positioned(
          bottom: 0,
          child: SlidingContainer(
            child: Container(
                height: containerHeight * 0.55,
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
                      style: FontUtils.getfontStyle(
                        fontSize: 27.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      AppConstants.appName,
                      style: FontUtils.getfontStyle(
                        fontSize: 39.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!
                          .getTranslatedValue('Enter_your_details_below'),
                      style: FontUtils.getfontStyle(
                        color: Color.fromRGBO(102, 102, 102, 1),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    CustomTextInputWithIcon(
                      hintText: AppLocalizations.of(context)!
                          .getTranslatedValue('email'),
                      iconPath: 'Assets/Icon/shape.svg',
                      containerWidth: containerWidth * 0.8,
                      containerHeight: containerHeight * 0.06,
                      controller: emailController,
                      validator: (value) => Validators.validateUsername(value),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    CustomTextInputWithIcon(
                      hintText: AppLocalizations.of(context)!
                          .getTranslatedValue('password'),
                      iconPath: 'Assets/Icon/password.svg',
                      containerWidth: containerWidth * 0.8,
                      containerHeight: containerHeight * 0.06,
                      controller: passwordController,
                      validator: (value) => Validators.validatePassword(value),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 32.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/forgot-password');
                            },
                            child: Text(
                                AppLocalizations.of(context)!
                                    .getTranslatedValue('forgot_password'),
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontFamily: "Manrope",
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        ),
                      ],
                    ),
                    CustomContainerButton(
                      text: AppLocalizations.of(context)!
                          .getTranslatedValue('login'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      height: containerHeight * 0.06,
                      width: containerWidth * 0.8,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!
                              .getTranslatedValue("donthaveanaccount"),
                          style: FontUtils.getfontStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                              AppLocalizations.of(context)!
                                  .getTranslatedValue("Clickhere"),
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: "Manrope",
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              )),
                        )
                      ],
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
