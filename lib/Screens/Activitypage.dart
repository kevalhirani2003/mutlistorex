import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multistorex_mobileapp_/Screens/Categoryscreen.dart';
import 'package:multistorex_mobileapp_/Screens/Profilepage.dart';
import 'package:multistorex_mobileapp_/Screens/homepage.dart';

class Myactivitypage extends StatefulWidget {
  const Myactivitypage({super.key});

  @override
  _MyactivitypageState createState() => _MyactivitypageState();
}

class _MyactivitypageState extends State<Myactivitypage> {
  int _currentPageIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            children: const [
              Homepage(),
              Categoryscreen(),
              Profilescreen(),
            ],
          ),
          Positioned(
            bottom: containerWidth * 0.07,
            left: containerWidth * 0.05,
            child: CustomNavigationBar(
              selectedIndex: _currentPageIndex,
              onSelect: (index) {
                setState(() {
                  _currentPageIndex = index;
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onSelect;

  const CustomNavigationBar(
      {super.key, required this.selectedIndex, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: MediaQuery.of(context).size.width - 40.0,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(250, 103, 129, 1),
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomNavItem(
            svgPath: 'Assets/Icon/Home.svg',
            onPressed: () {
              onSelect(0);
            },
            isSelected: selectedIndex == 0,
          ),
          CustomNavItem(
            svgPath: 'Assets/Icon/Person.svg',
            onPressed: () {
              onSelect(1);
            },
            isSelected: selectedIndex == 1,
          ),
          CustomNavItem(
            svgPath: 'Assets/Icon/Profile.svg',
            onPressed: () {
              onSelect(2);
            },
            isSelected: selectedIndex == 2,
          ),
          CustomNavItem(
            svgPath: 'Assets/Icon/bottomcart.svg',
            onPressed: () {
              onSelect(3);
            },
            isSelected: selectedIndex == 3,
          ),
        ],
      ),
    );
  }
}

class CustomNavItem extends StatelessWidget {
  final String svgPath;
  final VoidCallback onPressed;
  final bool isSelected;

  const CustomNavItem({
    super.key,
    required this.svgPath,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? const Color.fromRGBO(255, 255, 255, 1)
              : const Color.fromRGBO(250, 103, 129, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            svgPath,
            colorFilter: isSelected
                ? const ColorFilter.mode(
                    Color.fromRGBO(250, 103, 129, 1),
                    BlendMode.srcIn,
                  )
                : const ColorFilter.mode(
                    Color.fromRGBO(255, 255, 255, 1),
                    BlendMode.srcIn,
                  ),
          ),
        ),
      ),
    );
  }
}
