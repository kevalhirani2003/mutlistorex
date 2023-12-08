import 'package:flutter/material.dart';

class customfloatingbutton extends StatelessWidget {
  const customfloatingbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/Addaddress');
      },
      child: Container(
          width: 56.0,
          height: 56.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 4),
                blurRadius: 4,
              ),
            ],
          ),
          child: Icon(
            Icons.add,
          )),
    );
  }
}
