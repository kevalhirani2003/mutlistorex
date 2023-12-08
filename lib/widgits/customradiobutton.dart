import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multistorex_mobileapp_/utils/consantnames.dart';
import 'package:multistorex_mobileapp_/widgits/customtextstyle.dart';

class CustomRadio extends StatelessWidget {
  final String label;
  final String? value;
  final String? groupValue;
  final ValueChanged<String?>? onChanged;

  CustomRadio({
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      child: Row(
        children: [
          Container(
            child: SvgPicture.asset(groupValue == value
                ? "Assets/Icon/radio_button_checked.svg"
                : "Assets/Icon/radio_button_unchecked.svg"),
          ),
          SizedBox(
            width: 7.0,
          ),
          Text(
            label,
            style: FontUtils.getfontStyle(
              color: AppConstants.Textcolor,
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
