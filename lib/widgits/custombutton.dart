import 'package:flutter/material.dart';

class CustomContainerButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final Color? backgroundColor;

  const CustomContainerButton({super.key, 
    required this.text,
    this.onPressed,
    this.width,
    this.height,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? 200.0,
        height: height ?? 50.0,
        decoration: BoxDecoration(
          color: backgroundColor ?? const Color.fromRGBO(250, 103, 129, 1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: "Manrope",
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
