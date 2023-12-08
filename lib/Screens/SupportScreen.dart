import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multistorex_mobileapp_/utils/consantnames.dart';
import 'package:multistorex_mobileapp_/widgits/customtextstyle.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height;
    double containerWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
          backgroundColor: AppConstants.frequetcolor,
          title: Text(
            'Support',
            style: FontUtils.getfontStyle(
              color: Color.fromRGBO(51, 51, 51, 1),
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Image.asset("Assets/Images/support-82NJi6UBb7.png")),
              Container(
                  height: containerHeight * 0.05,
                  width: containerWidth * 0.6,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(241, 241, 241, 1),
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "Assets/Icon/Email.svg",
                        colorFilter: ColorFilter.mode(
                          Color.fromRGBO(97, 155, 223, 1),
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(
                        width: containerWidth * 0.05,
                      ),
                      Text("biz.multisorex.com",
                          style: FontUtils.getfontStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color.fromRGBO(51, 51, 51, 1)))
                    ],
                  )),
              SizedBox(
                height: containerHeight * 0.02,
              ),
              Container(
                  height: containerHeight * 0.05,
                  width: containerWidth * 0.6,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(241, 241, 241, 1),
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "Assets/Icon/whatapp.svg",
                      ),
                      SizedBox(
                        width: containerWidth * 0.05,
                      ),
                      Text("+91 1234567890",
                          style: FontUtils.getfontStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color.fromRGBO(51, 51, 51, 1)))
                    ],
                  )),
              SizedBox(
                height: containerHeight * 0.02,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Follow Us:"),
                  SizedBox(
                    width: containerWidth * 0.022,
                  ),
                  SvgPicture.asset("Assets/Icon/Facebook.svg"),
                  SizedBox(
                    width: containerWidth * 0.022,
                  ),
                  SvgPicture.asset("Assets/Icon/x_icon.svg"),
                  SizedBox(
                    width: containerWidth * 0.022,
                  ),
                  SvgPicture.asset("Assets/Icon/Instagram.svg"),
                  SizedBox(
                    width: containerWidth * 0.022,
                  ),
                  SvgPicture.asset("Assets/Icon/Youtube.svg"),
                ],
              )
            ],
          ),
        ));
  }
}
