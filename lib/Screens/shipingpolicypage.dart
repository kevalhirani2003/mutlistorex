import 'package:flutter/material.dart';
import 'package:multistorex_mobileapp_/utils/consantnames.dart';
import 'package:multistorex_mobileapp_/widgits/customtextstyle.dart';

class shipingscren extends StatelessWidget {
  const shipingscren({super.key});

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height;
    double containerWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromRGBO(51, 51, 51, 1)),
          title: Text(
            "Policy",
            style: FontUtils.getfontStyle(
              color: AppConstants.Textcolor,
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
          ),
          backgroundColor: AppConstants.frequetcolor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shipping policy",
                  style: FontUtils.getfontStyle(
                    color: AppConstants.Textcolor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: containerHeight * 0.015,
                ),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tempus vehicula risus id tempus. Nam velit dolor, pellentesque ut imperdiet fringilla, ullamcorper lacinia arcu. Nam venenatis tincidunt ipsum. In sed sapien sem. Morbi a orci tempor, suscipit nulla quis, ullamcorper ligula.\n\n Nam mauris urna, commodo quis leo quis, maximus iaculis tortor. Cras nibh neque, faucibus a convallis sed, accumsan nec augue. Donec laoreet quam ac neque interdum, et tempus lorem volutpat. Morbi commodo vulputate nulla, vitae vehicula justo facilisis et. Duis id lacus dolor. Sed luctus ipsum nibh, ac auctor mauris iaculis eget. Nulla orci neque, pellentesque nec magna ut, finibus volutpat eros. Morbi ac ligula velit. Vestibulum mi eros, vehicula vitae enim nec, semper sodales magna. Donec mollis vestibulum est."),
                SizedBox(
                  height: containerHeight * 0.03,
                ),
                Text(
                  "Return policy",
                  style: FontUtils.getfontStyle(
                    color: AppConstants.Textcolor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: containerHeight * 0.015,
                ),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tempus vehicula risus id tempus. Nam velit dolor, pellentesque ut imperdiet fringilla, ullamcorper lacinia arcu. Nam venenatis tincidunt ipsum. In sed sapien sem. Morbi a orci tempor, suscipit nulla quis, ullamcorper ligula.\n\nNam mauris urna, commodo quis leo quis, maximus iaculis tortor. Cras nibh neque, faucibus a convallis sed, accumsan nec augue. Donec laoreet quam ac neque interdum, et tempus lorem volutpat. Morbi commodo vulputate nulla, vitae vehicula justo facilisis et. Duis id lacus dolor. Sed luctus ipsum nibh, ac auctor mauris iaculis eget. Nulla orci neque, pellentesque nec magna ut, finibus volutpat eros. Morbi ac ligula velit. Vestibulum mi eros, vehicula vitae enim nec, semper sodales magna. Donec mollis vestibulum est.\n\nPhasellus eu nisi aliquam, eleifend enim vel, facilisis diam. Etiam aliquet mauris vel turpis finibus, quis consequat nisi fermentum. Suspendisse condimentum interdum ornare. Donec vehicula sem at cursus pulvinar. Duis id nibh sagittis risus hendrerit vulputate. Nullam interdum accumsan dolor, quis varius ipsum rutrum ut. Nullam ut tellus est. Nulla imperdiet magna felis, quis finibus justo tincidunt sed. Mauris at felis quis ante vestibulum aliquam sed ut mauris. Aenean lacinia velit a urna dignissim euismod. Proin ante leo, iaculis eu ante eget, condimentum dapibus ipsum."),
                SizedBox(
                  height: containerHeight * 0.03,
                ),
                Text(
                  "Exchange policy",
                  style: FontUtils.getfontStyle(
                    color: AppConstants.Textcolor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: containerHeight * 0.015,
                ),
                Text(
                    "Nam mauris urna, commodo quis leo quis, maximus iaculis tortor. Cras nibh neque, faucibus a convallis sed, accumsan nec augue. Donec laoreet quam ac neque interdum, et tempus lorem volutpat. Morbi commodo vulputate nulla, vitae vehicula justo facilisis et. Duis id lacus dolor. Sed luctus ipsum nibh, ac auctor mauris iaculis eget. Nulla orci neque, pellentesque nec magna ut, finibus volutpat eros. Morbi ac ligula velit. Vestibulum mi eros, vehicula vitae enim nec, semper sodales magna. Donec mollis vestibulum est.\n\nPhasellus eu nisi aliquam, eleifend enim vel, facilisis diam. Etiam aliquet mauris vel turpis finibus, quis consequat nisi fermentum. Suspendisse condimentum interdum ornare. Donec vehicula sem at cursus pulvinar. Duis id nibh sagittis risus hendrerit vulputate. Nullam interdum accumsan dolor, quis varius ipsum rutrum ut. Nullam ut tellus est. Nulla imperdiet magna felis, quis finibus justo tincidunt sed. Mauris at felis quis ante vestibulum aliquam sed ut mauris. Aenean lacinia velit a urna dignissim euismod. Proin ante leo, iaculis eu ante eget, condimentum dapibus ipsum.")
              ],
            ),
          ),
        ));
  }
}
