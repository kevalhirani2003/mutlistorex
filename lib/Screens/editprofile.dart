import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multistorex_mobileapp_/apps/app_locationzaltion.dart';
import 'package:multistorex_mobileapp_/cubit/usercubit.dart';
import 'package:multistorex_mobileapp_/widgits/Validation.dart';
import 'package:multistorex_mobileapp_/widgits/customappbar.dart';
import 'package:multistorex_mobileapp_/widgits/custombutton.dart';
import 'package:multistorex_mobileapp_/widgits/customtextfield.dart';

class UpdateUserInfoPage extends StatefulWidget {
  final String? initialImagePath;

  const UpdateUserInfoPage({Key? key, this.initialImagePath}) : super(key: key);

  @override
  State<UpdateUserInfoPage> createState() => _UpdateUserInfoPageState();
}

class _UpdateUserInfoPageState extends State<UpdateUserInfoPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();

  XFile? pickedFile;

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height;
    double containerWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: containerHeight * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppBar(
                  containerHeight: containerHeight,
                  containerWidth: containerWidth),
              SizedBox(height: containerHeight * 0.05),
              GestureDetector(
                onTap: () async {
                  pickedFile =
                      await _imagePicker.pickImage(source: ImageSource.gallery);
                  print('Picked file: $pickedFile');

                  if (pickedFile != null) {
                    context.read<UserInfoCubit>().updateUserInfo(
                          name: nameController.text,
                          email: emailController.text,
                          phoneNumber: phoneNumberController.text,
                          password: passwordController.text,
                          imagePath: pickedFile!.path,
                        );
                  }
                  setState(() {});
                },
                child: BlocBuilder<UserInfoCubit, UserInfoState>(
                    builder: (context, state) {
                  return Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: (state.imagePath !=
                                "Assets/Images/default_profile.jpeg")
                            ? FileImage(File(state.imagePath)) as ImageProvider
                            : const AssetImage('Assets/Images/default_profile.jpeg'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 10,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SvgPicture.asset(
                              "Assets/Icon/pencil.svg",
                              fit: BoxFit.cover,
                            )),
                      ),
                    ],
                  );
                }),
              ),
              const SizedBox(height: 20),
              CustomTextInputWithIcon(
                controller: nameController,
                hintText: (AppLocalizations.of(context)!
                    .getTranslatedValue("fullname")),
                iconPath: "Assets/Icon/shape.svg",
                validator: (value) => Validators.validateUsername(value),
                containerHeight: containerHeight * 0.06,
                containerWidth: containerWidth * 0.9,
              ),
              const SizedBox(height: 20),
              CustomTextInputWithIcon(
                controller: emailController,
                hintText:
                    (AppLocalizations.of(context)!.getTranslatedValue("email")),
                iconPath: "Assets/Icon/Email.svg",
                validator: (value) => Validators.validateUsername(value),
                containerHeight: containerHeight * 0.06,
                containerWidth: containerWidth * 0.9,
              ),
              const SizedBox(height: 20),
              CustomTextInputWithIcon(
                controller: phoneNumberController,
                hintText: (AppLocalizations.of(context)!
                    .getTranslatedValue("phonenumber")),
                iconPath: "Assets/Icon/Phone_no.svg",
                validator: (value) => Validators.validateUsername(value),
                containerHeight: containerHeight * 0.06,
                containerWidth: containerWidth * 0.9,
              ),
              const SizedBox(height: 20),
              CustomTextInputWithIcon(
                controller: passwordController,
                hintText: (AppLocalizations.of(context)!
                    .getTranslatedValue("password")),
                iconPath: "Assets/Icon/password.svg",
                validator: (value) => Validators.validateUsername(value),
                containerHeight: containerHeight * 0.06,
                containerWidth: containerWidth * 0.9,
              ),
              const SizedBox(height: 20),
              CustomContainerButton(
                  text: AppLocalizations.of(context)!
                      .getTranslatedValue("update0"),
                  onPressed: () {
                    context.read<UserInfoCubit>().updateUserInfo(
                          name: nameController.text,
                          email: emailController.text,
                          phoneNumber: phoneNumberController.text,
                          password: passwordController.text,
                          imagePath: widget.initialImagePath ??
                              'assets/images/default_profile_image.png',
                        );
                    Navigator.pop(context);
                  },
                  width: containerWidth * 0.9,
                  height: containerWidth * 0.15)
            ],
          ),
        ),
      ),
    );
  }
}
