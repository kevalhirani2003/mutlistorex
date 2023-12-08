import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multistorex_mobileapp_/widgits/customtextstyle.dart';

typedef ValidatorFunction = String? Function(String? value);

class CustomTextInputWithIcon extends StatelessWidget {
  final String hintText;
  final String iconPath;
  final double containerWidth;
  final double containerHeight;
  final TextEditingController controller;
  final ValidatorFunction validator;

  const CustomTextInputWithIcon({
    Key? key,
    required this.hintText,
    required this.iconPath,
    this.containerWidth = 400, // Default width
    this.containerHeight = 50, // Default height
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: const Color.fromRGBO(204, 204, 204, 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
            child: SvgPicture.asset(iconPath),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              validator: validator,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: FontUtils.getfontStyle(
                  color: const Color.fromRGBO(102, 102, 102, 1),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
