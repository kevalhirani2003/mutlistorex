import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:multistorex_mobileapp_/apps/app_locationzaltion.dart';

import 'package:multistorex_mobileapp_/widgits/Validation.dart';
import 'package:multistorex_mobileapp_/widgits/animation/customsildinganimation.dart';
import 'package:multistorex_mobileapp_/widgits/custombutton.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multistorex_mobileapp_/widgits/customtextfield.dart';
import 'package:multistorex_mobileapp_/widgits/customtextstyle.dart';
import 'package:multistorex_mobileapp_/widgits/onboardingscreen.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  File? image;
  @override
  Widget build(BuildContext context) {
    Future pickImage() async {
      try {
        final image1 =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image1 == null) return;
        final imageTemporary = File(image1.path);
        image = imageTemporary;
        setState(() {});
        print("object");
      } on PlatformException catch (e) {
        print("failed to catch the file $e");
      }

      Future _pickhello() async {
        try {
          final image1 =
              await ImagePicker().pickImage(source: ImageSource.camera);
          if (image1 == null) return;
          final imageTemporary = File(image1.path);
          image = imageTemporary;
          setState(() {});
          print("object");
        } on PlatformException catch (e) {
          print("failed to catch the file $e");
        }
      }
    }

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController phonenoController = TextEditingController();

    double containerHeight = MediaQuery.of(context).size.height;
    double containerWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        WelcomeStack(
          containerHeight: containerHeight,
          containerWidth: containerWidth,
        ),
        Positioned(
          child: SlidingContainer(
            endOffset: const Offset(0.0, 0.20),
            child: Stack(children: [
              Column(children: [
                Text(
                  AppLocalizations.of(context)!
                      .getTranslatedValue('registerwithus'),
                  style: FontUtils.getfontStyle(
                    fontFamily: "Inter",
                    fontSize: 39.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: containerHeight * 0.12,
                ),
                Container(
                  height: containerHeight * 0.75,
                  width: containerWidth,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 239, 228, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0)),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: containerHeight * 0.09,
                        ),
                        CustomTextInputWithIcon(
                          hintText: AppLocalizations.of(context)!
                              .getTranslatedValue('username'),
                          iconPath: "Assets/Icon/shape.svg",
                          containerWidth: containerWidth * 0.8,
                          containerHeight: containerHeight * 0.06,
                          controller: emailController,
                          validator: Validators.validateEmail,
                        ),
                        SizedBox(
                          height: containerHeight * 0.02,
                        ),
                        CustomTextInputWithIcon(
                          hintText: AppLocalizations.of(context)!
                              .getTranslatedValue('email'),
                          iconPath: "Assets/Icon/Email.svg",
                          containerWidth: containerWidth * 0.8,
                          containerHeight: containerHeight * 0.06,
                          controller: emailController,
                          validator: (value) => Validators.validateEmail(value),
                        ),
                        SizedBox(
                          height: containerHeight * 0.02,
                        ),
                        CustomTextInputWithIcon(
                          hintText: AppLocalizations.of(context)!
                              .getTranslatedValue('phonenumber'),
                          iconPath: "Assets/Icon/Phone_no.svg",
                          containerWidth: containerWidth * 0.8,
                          containerHeight: containerHeight * 0.06,
                          controller: phonenoController,
                          validator: (value) =>
                              Validators.validatePhoneNumber(value),
                        ),
                        SizedBox(
                          height: containerHeight * 0.02,
                        ),
                        CustomTextInputWithIcon(
                          hintText: AppLocalizations.of(context)!
                              .getTranslatedValue('password'),
                          iconPath: "Assets/Icon/password.svg",
                          containerWidth: containerWidth * 0.8,
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
                          containerWidth: containerWidth * 0.8,
                          containerHeight: containerHeight * 0.06,
                          controller: confirmPasswordController,
                          validator: (value) =>
                              Validators.validateConfirmPassword(
                                  passwordController.text, value),
                        ),
                        SizedBox(height: containerHeight * 0.02),
                        CustomContainerButton(
                          text:
                              AppLocalizations.of(context)!.getTranslatedValue(
                            'register',
                          ),
                          onPressed: () {},
                          height: containerHeight * 0.06,
                          width: containerWidth * 0.8,
                        ),
                        SizedBox(
                          height: containerHeight * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .getTranslatedValue('alreadyhaveanaccount'),
                              style: FontUtils.getfontStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text(
                                AppLocalizations.of(context)!
                                    .getTranslatedValue('Clickhere'),
                                style: FontUtils.getfontStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              ]),
              Positioned(
                top: containerHeight * 0.12,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.file(
                                    image!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.fitHeight,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50)),
                                  width: 100,
                                  height: 100,
                                  child: const Icon(Icons.person,
                                      size: 50, color: Colors.black),
                                )),
                    ),
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              pickImage();
                            },
                            icon: const Icon(Icons.camera_alt),
                          ),
                        ))
                  ],
                ),
              ),
            ]),
          ),
        )
      ],
    ));
  }
}
