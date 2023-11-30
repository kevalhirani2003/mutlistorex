import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multistorex_mobileapp_/Screens/Onboadringscreen.dart';
import 'package:multistorex_mobileapp_/apps/app_locationzaltion.dart';
import 'package:multistorex_mobileapp_/widgits/Validation.dart';
import 'package:multistorex_mobileapp_/widgits/animation/customsildinganimation.dart';
import 'package:multistorex_mobileapp_/widgits/custombutton.dart';
import 'package:multistorex_mobileapp_/widgits/customtextfield.dart';
import 'package:multistorex_mobileapp_/widgits/customtextstyle.dart';
import 'package:multistorex_mobileapp_/widgits/onboardingscreen.dart';

class Forgotpasswordpage extends StatelessWidget {
  const Forgotpasswordpage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    double containerHeight = MediaQuery.of(context).size.height;
    double containerWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        WelcomeStack(
            containerHeight: containerHeight, containerWidth: containerWidth),
        Positioned(
          child: SlidingContainer(
              endOffset: Offset(0.0, 0.6),
              child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 239, 228, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0)),
                  ),
                  height: containerHeight * 0.5,
                  width: containerWidth,
                  child: Column(
                    children: [
                      SizedBox(
                        height: containerHeight * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 60.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .getTranslatedValue('back'),
                              style: FontUtils.getfontStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: containerWidth * 0.02,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Onboardingscreen()));
                              },
                              child: SvgPicture.asset(
                                "Assets/Icon/cross.svg",
                                height: 12,
                                width: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: containerHeight * 0.01,
                      ),
                      Text(
                        AppLocalizations.of(context)!
                            .getTranslatedValue('reset password'),
                        style: FontUtils.getfontStyle(
                          fontSize: 39.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.getTranslatedValue(
                            'enter your new passwords below'),
                        style: FontUtils.getfontStyle(
                          color: Color.fromRGBO(102, 102, 102, 1),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: containerHeight * 0.02,
                      ),
                      CustomTextInputWithIcon(
                        hintText: AppLocalizations.of(context)!
                            .getTranslatedValue('password'),
                        iconPath: "Assets/Icon/password.svg",
                        containerWidth: containerWidth * 0.73,
                        containerHeight: containerHeight * 0.06,
                        controller: passwordController,
                        validator: (value) =>
                            Validators.validatePassword(value),
                      ),
                      SizedBox(
                        height: containerHeight * 0.02,
                      ),
                      CustomTextInputWithIcon(
                        hintText: AppLocalizations.of(context)!
                            .getTranslatedValue('confirmpassword'),
                        iconPath: "Assets/Icon/password.svg",
                        containerWidth: containerWidth * 0.73,
                        containerHeight: containerHeight * 0.06,
                        controller: confirmPasswordController,
                        validator: (value) =>
                            Validators.validatePassword(value),
                      ),
                      SizedBox(
                        height: containerHeight * 0.02,
                      ),
                      CustomContainerButton(
                          text: AppLocalizations.of(context)!
                              .getTranslatedValue('reset password'),
                          height: containerHeight * 0.05,
                          width: containerWidth * 0.73,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Onboardingscreen()));
                          })
                    ],
                  ))),
        )
      ],
    ));
  }
}
