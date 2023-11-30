import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavigationBar extends StatefulWidget {
  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height;
    double containerWidth = MediaQuery.of(context).size.width;
    return Container(
      height: containerHeight * 0.075,
      width: containerWidth * 0.8,
      decoration: BoxDecoration(
        color: Color.fromRGBO(250, 103, 129, 1),
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomNavItem(
            svgPath: 'Assets/Icon/Home.svg',
            onPressed: () {
              _selectItem(0);
            },
            isSelected: _selectedIndex == 0,
          ),
          CustomNavItem(
            svgPath: 'Assets/Icon/Profile.svg',
            onPressed: () {
              _selectItem(1);
              Navigator.pushNamed(context, '/login');
            },
            isSelected: _selectedIndex == 1,
          ),
          CustomNavItem(
            svgPath: 'Assets/Icon/Person.svg',
            onPressed: () {
              _selectItem(2);
            },
            isSelected: _selectedIndex == 2,
          ),
          CustomNavItem(
            svgPath: 'Assets/Icon/bottomcart.svg',
            onPressed: () {
              _selectItem(3);
            },
            isSelected: _selectedIndex == 3,
          ),
        ],
      ),
    );
  }

  void _selectItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class CustomNavItem extends StatelessWidget {
  final String svgPath;
  final VoidCallback onPressed;
  final bool isSelected;

  CustomNavItem({
    required this.svgPath,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height;
    double containerWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: containerWidth * 0.1,
        height: containerHeight * 0.1,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? Color.fromRGBO(255, 255, 255, 1)
              : Color.fromRGBO(250, 103, 129, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(svgPath,
              colorFilter: isSelected
                  ? ColorFilter.mode(
                      Color.fromRGBO(250, 103, 129, 1),
                      BlendMode.srcIn,
                    )
                  : ColorFilter.mode(
                      Color.fromRGBO(255, 255, 255, 1),
                      BlendMode.srcIn,
                    )),
        ),
      ),
    );
  }
}
