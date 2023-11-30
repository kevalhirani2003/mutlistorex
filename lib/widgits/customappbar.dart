import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multistorex_mobileapp_/consantnames.dart';

class CustomAppBar extends StatelessWidget {
  final double containerHeight;
  final double containerWidth;

  const CustomAppBar({
    Key? key,
    required this.containerHeight,
    required this.containerWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: containerHeight * 0.075,
          width: containerWidth,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 216, 156, 1),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    height: 30,
                    width: 30,
                    child: SvgPicture.asset(AppConstants.logoImagepath),
                  ),
                ),
                SizedBox(
                  width: containerWidth * 0.02,
                ),
                Text(
                  AppConstants.appName,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  child: Container(
                    height: 30,
                    width: 30,
                    child: SvgPicture.asset("Assets/Icon/bell.svg"),
                  ),
                ),
                SizedBox(
                  width: containerWidth * 0.02,
                ),
                GestureDetector(
                  child: Container(
                    height: 30,
                    width: 30,
                    child: SvgPicture.asset("Assets/Icon/heart.svg"),
                  ),
                ),
                SizedBox(
                  width: containerWidth * 0.02,
                ),
                GestureDetector(
                  child: Container(
                    height: 30,
                    width: 30,
                    child: SvgPicture.asset("Assets/Icon/cart.svg"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
