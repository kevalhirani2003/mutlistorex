import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multistorex_mobileapp_/utils/consantnames.dart';

class WelcomeStack extends StatelessWidget {
  final double containerHeight;
  final double containerWidth;

  const WelcomeStack({
    super.key,
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
          decoration:
              const BoxDecoration(color: Color.fromRGBO(187, 187, 187, 0.4)),
          child: Image.asset(
            "Assets/Images/Onboarding.png", // Make sure the path is correct
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: containerWidth,
            height: containerHeight * 0.3,
            decoration: const BoxDecoration(
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
                    const Text(
                      "Welcome to", // Replace with your localized string
                      style: TextStyle(
                        fontSize: 27.0,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
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
                        const SizedBox(
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
                    SizedBox(
                      width: containerWidth * 0.9,
                      child: const Text(
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
            decoration: const BoxDecoration(
              color: Color.fromRGBO(187, 187, 187, 0.4),
            ),
          ),
        ),
      ],
    );
  }
}
