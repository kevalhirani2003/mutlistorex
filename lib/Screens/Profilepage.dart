import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multistorex_mobileapp_/Screens/editprofile.dart';
import 'package:multistorex_mobileapp_/apps/app_locationzaltion.dart';
import 'package:multistorex_mobileapp_/cubit/usercubit.dart';
import 'package:multistorex_mobileapp_/widgits/customappbar.dart';
import 'package:multistorex_mobileapp_/widgits/custombuttononlyrow.dart';
import 'package:multistorex_mobileapp_/widgits/customtextstyle.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height;
    double containerWidth = MediaQuery.of(context).size.width;
    return Scaffold(body:
        BlocBuilder<UserInfoCubit, UserInfoState>(builder: (context, state) {
      return Padding(
        padding: EdgeInsets.only(
          top: containerHeight * 0.035,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: containerHeight * 0.13),
            child: Column(
              children: [
                CustomAppBar(
                    containerHeight: containerHeight,
                    containerWidth: containerWidth),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateUserInfoPage(
                            initialImagePath: state.imagePath,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: Text(
                              "Hello ${state.name},",
                              style: FontUtils.getfontStyle(
                                color: Colors.black,
                                fontSize: 29.0,
                              ),
                            )),
                            Container(
                                child: Text(
                              state.email,
                              style: FontUtils.getfontStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                              ),
                            )),
                          ],
                        ),
                        const Spacer(),
                        Stack(
                          children: [
                            BlocBuilder<UserInfoCubit, UserInfoState>(
                                builder: (context, state) {
                              return CircleAvatar(
                                radius: 50,
                                backgroundImage: (state.imagePath !=
                                        "Assets/Images/default_profile.jpeg")
                                    ? FileImage(File(state.imagePath))
                                        as ImageProvider
                                    : const AssetImage(
                                        'Assets/Images/default_profile.jpeg'),
                              );
                            }),
                            Positioned(
                              bottom: 0,
                              right: 5,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: SvgPicture.asset(
                                    "Assets/Icon/pencil.svg",
                                    fit: BoxFit.cover,
                                  )),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                DynamicRow(
                    buttonText: AppLocalizations.of(context)!
                        .getTranslatedValue("Orders"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/orders');
                    },
                    iconSvg: "Assets/Icon/orders.svg"),
                DynamicRow(
                    buttonText: AppLocalizations.of(context)!
                        .getTranslatedValue("manage_address"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/Manageaddress');
                    },
                    iconSvg: "Assets/Icon/manageaddress.svg"),
                DynamicRow(
                    buttonText: AppLocalizations.of(context)!
                        .getTranslatedValue("support"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/Support');
                    },
                    iconSvg: "Assets/Icon/support.svg"),
                DynamicRow(
                    buttonText: AppLocalizations.of(context)!
                        .getTranslatedValue("about_us"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/Aboutus');
                    },
                    iconSvg: "Assets/Icon/about_us.svg"),
                DynamicRow(
                    buttonText:
                        AppLocalizations.of(context)!.getTranslatedValue("faq"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/FAQ');
                    },
                    iconSvg: "Assets/Icon/FaQs.svg"),
                DynamicRow(
                    buttonText: AppLocalizations.of(context)!
                        .getTranslatedValue("shipping,return,exchange_policy"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/shipingandreturnpolicy');
                    },
                    iconSvg: "Assets/Icon/truck.svg"),
                DynamicRow(
                    buttonText: AppLocalizations.of(context)!
                        .getTranslatedValue("privacy_policy"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/orders');
                    },
                    iconSvg: "Assets/Icon/privacy Policy.svg"),
                DynamicRow(
                    buttonText: AppLocalizations.of(context)!
                        .getTranslatedValue("terms_of_use"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/orders');
                    },
                    iconSvg: "Assets/Icon/terms_of _use.svg"),
                DynamicRow(
                    buttonText: AppLocalizations.of(context)!
                        .getTranslatedValue("rate_our_app"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/orders');
                    },
                    iconSvg: "Assets/Icon/Rate_the_app.svg"),
                DynamicRow(
                    buttonText: AppLocalizations.of(context)!
                        .getTranslatedValue("delete_account"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/orders');
                    },
                    iconSvg: "Assets/Icon/delete.svg"),
                DynamicRow(
                    buttonText: AppLocalizations.of(context)!
                        .getTranslatedValue("logout"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/orders');
                    },
                    iconSvg: "Assets/Icon/logout.svg"),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
