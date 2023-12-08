import 'package:flutter/material.dart';
import 'package:multistorex_mobileapp_/utils/consantnames.dart';
import 'package:multistorex_mobileapp_/widgits/customtextstyle.dart';

class aboutusscreen extends StatelessWidget {
  const aboutusscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "About Us",
          style: FontUtils.getfontStyle(
            color: Color.fromRGBO(51, 51, 51, 1),
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
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
                "About Us",
                style: FontUtils.getfontStyle(
                  color: Color.fromRGBO(51, 51, 51, 1),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tempus vehicula risus id tempus. Nam velit dolor, pellentesque ut imperdiet fringilla, ullamcorper lacinia arcu. Nam venenatis tincidunt ipsum. In sed sapien sem. Morbi a orci tempor, suscipit nulla quis, ullamcorper ligula.Nam mauris urna, commodo quis leo quis, maximus iaculis tortor.\n\nCras nibh neque, faucibus a convallis sed, accumsan nec augue. Donec laoreet quam ac neque interdum, et tempus lorem volutpat. Morbi commodo vulputate nulla, vitae vehicula justo facilisis et. Duis id lacus dolor. Sed luctus ipsum nibh, ac auctor mauris iaculis eget. Nulla orci neque, pellentesque nec magna ut, finibus volutpat eros. Morbi ac ligula velit. Vestibulum mi eros, vehicula vitae enim nec, semper sodales magna. Donec mollis vestibulum est.\n\nPhasellus eu nisi aliquam, eleifend enim vel, facilisis diam. Etiam aliquet mauris vel turpis finibus, quis consequat nisi fermentum. Suspendisse condimentum interdum ornare. Donec vehicula sem at cursus pulvinar. Duis id nibh sagittis risus hendrerit vulputate. Nullam interdum accumsan dolor, quis varius ipsum rutrum ut. Nullam ut tellus est. Nulla imperdiet magna felis, quis finibus justo tincidunt sed. Mauris at felis quis ante vestibulum aliquam sed ut mauris. Aenean lacinia velit a urna dignissim euismod. Proin ante leo, iaculis eu ante eget, condimentum dapibus ipsum.",
                style: FontUtils.getfontStyle(
                    fontFamily: "Inter",
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 16),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text("Latest version 2.0.6",
                  style: FontUtils.getfontStyle(
                      fontFamily: "Inter",
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
