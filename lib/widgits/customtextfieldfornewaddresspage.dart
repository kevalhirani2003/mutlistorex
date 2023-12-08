import 'package:flutter/material.dart';
import 'package:multistorex_mobileapp_/utils/consantnames.dart';
import 'package:multistorex_mobileapp_/widgits/customtextstyle.dart';

class CustomTextFieldForNewAddressPage extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final IconData? icon;

  const CustomTextFieldForNewAddressPage({
    Key? key,
    this.hintText = 'Enter your address',
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    required this.controller,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height;
    double containerWidth = MediaQuery.of(context).size.width;
    return Container(
      height: containerHeight * 0.06,
      width: containerWidth * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color.fromRGBO(204, 204, 204, 1)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 22.0,
          right: 22,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: obscureText,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: FontUtils.getfontStyle(
                    fontFamily: "Manrope",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppConstants.Textcolor,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            if (icon != null) ...[
              SizedBox(width: 10),
              Icon(
                icon,
                color: AppConstants.Textcolor,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
