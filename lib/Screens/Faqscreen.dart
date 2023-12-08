import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multistorex_mobileapp_/utils/consantnames.dart';
import 'package:multistorex_mobileapp_/widgits/customquestionandanswer.dart';
import 'package:multistorex_mobileapp_/widgits/customtextstyle.dart';

class FAQscreen extends StatelessWidget {
  final List<String> questions = [
    "In fringilla nunc sit amet lacus rhoncus, quis pellentesque nisl vulputate?",
    "Quisque lacinia diam non lacus euismod egestas?",
    "Donec rhoncus nibh ut est vulputate, at vestibulum ipsum?",
    "Quisque ultrices tortor?",
    "Cras vel leo et justo aliquet luctus?",
    "Aenean malesuada ipsum sed magna eleifend auctor?"
    // Add more questions as needed
  ];

  final List<String> answers = [
    "Vitae congue eu consequat ac felis placerat vestibulum lectus mauris ultrices. Cursus sit amet dictum sit amet justo donec enim diam porttitor lacus luctus accumsan tortor posuere.",
    "You can install Flutter by following the installation guide on the official Flutter website.",
    "You can install Flutter by following the installation guide on the official Flutter website.",
    "You can create a new Flutter project using the 'flutter create' command in the terminal.",
    "You can create a new Flutter project using the 'flutter create' command in the terminal.",
    " You can create a new Flutter project using the 'flutter create' command in the terminal."
    // Add corresponding answers as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromRGBO(51, 51, 51, 1),
        ),
        backgroundColor: AppConstants.frequetcolor,
        title: Text(
          'FAQs',
          style: FontUtils.getfontStyle(
            color: Color.fromRGBO(
              51,
              51,
              51,
              1,
            ),
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return FaqCard(
              question: questions[index],
              answer: answers[index],
            );
          },
        ),
      ),
    );
  }
}
