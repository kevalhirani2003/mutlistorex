import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multistorex_mobileapp_/widgits/customtextstyle.dart';

class FaqCard extends StatefulWidget {
  final String question;
  final String answer;

  FaqCard({required this.question, required this.answer});

  @override
  _FaqCardState createState() => _FaqCardState();
}

class _FaqCardState extends State<FaqCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Color.fromRGBO(0, 0, 0, 0.1)),
          ),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(widget.question,
                  style: FontUtils.getfontStyle(
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(51, 51, 51, 1),
                    fontSize: 16.0,
                  )),
              trailing: IconButton(
                icon: SvgPicture.asset(
                  isExpanded ? 'Assets/Icon/minus.svg' : 'Assets/Icon/Plus.svg',
                  width: 12.0,
                  height: 6.0,
                ),
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
              ),
            ),
            if (isExpanded)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  widget.answer,
                  style: FontUtils.getfontStyle(
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(102, 102, 102, 1),
                    fontSize: 14.0,
                  ),
                ),
              ),
          ],
        ));
  }
}
