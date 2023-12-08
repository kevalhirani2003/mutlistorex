import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multistorex_mobileapp_/widgits/customtextstyle.dart';

class DynamicRow extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  final String iconSvg;

  const DynamicRow({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.iconSvg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1.0, color: Color.fromRGBO(204, 204, 204, 1)))),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Handle onPressed action
                onPressed();
              },
              child: Container(
                padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: 20), // You can set your desired color
                child: Text(
                  buttonText,
                  style: FontUtils.getfontStyle(
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(51, 51, 51, 1),
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // Handle icon pressed action
              onPressed();
            },
            icon: SvgPicture.asset(
              iconSvg,
              width: 24.0,
              height: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
