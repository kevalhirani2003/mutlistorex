import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multistorex_mobileapp_/consantnames.dart';

class WelcomeStack extends StatelessWidget {
  final double containerHeight;
  final double containerWidth;

  WelcomeStack({
    required this.containerHeight,
    required this.containerWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          height: containerHeight,
          decoration: BoxDecoration(color: Color.fromRGBO(187, 187, 187, 0.4)),
          child: Image.asset(
            "Assets/Images/Onboarding.png", // Make sure the path is correct
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: containerWidth,
            height: containerHeight * 0.3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 255, 255, 0),
                  Color.fromRGBO(246, 197, 123, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 28.0, top: 50.0, right: 28.0),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to", // Replace with your localized string
                      style: TextStyle(
                        fontSize: 27.0,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          AppConstants
                              .appName, // Replace with your localized string
                          style: TextStyle(
                            color: Color.fromRGBO(17, 17, 17, 1),
                            fontSize: 39.0,
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                            letterSpacing: 0.0,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        GestureDetector(
                          child: Container(
                            child: SvgPicture.asset(
                              'Assets/Icon/arrow.svg',
                              height: 41.0,
                              width: 32.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: containerWidth * 0.9,
                      child: Text(
                        "Skip", // Replace with your localized string
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: containerHeight * 1,
            width: containerWidth,
            decoration: BoxDecoration(
              color: Color.fromRGBO(187, 187, 187, 0.4),
            ),
          ),
        ),
      ],
    );
  }
}
