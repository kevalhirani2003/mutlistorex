import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multistorex_mobileapp_/apps/app_locationzaltion.dart';
import 'package:multistorex_mobileapp_/cubit/Homecubit.dart';

import 'package:multistorex_mobileapp_/widgits/customappbar.dart';

import 'package:multistorex_mobileapp_/widgits/customseacrh.dart';
import 'package:multistorex_mobileapp_/widgits/customtextstyle.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height;
    double containerWidth = MediaQuery.of(context).size.width;

    // Load categories when the widget is built
    Future<void> loadCategories() async {
      try {
        await context.read<HomeCubit>().LoadCategoriesforHomepage();
      } catch (e) {
        print('Error loading categories: $e');
      }
    }

    // Call loadCategories when the widget is first built
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      loadCategories();
    });

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: containerHeight * 0.035,
                ),
                child: CustomAppBar(
                  containerHeight: containerHeight,
                  containerWidth: containerWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10.0, right: 10.0),
                child: Container(
                  height: containerHeight * 0.05,
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!
                            .getTranslatedValue('deliever to'),
                        style: FontUtils.getfontStyle(
                          color: Color.fromRGBO(102, 102, 102, 1),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 26,
                        width: 26,
                        child: SvgPicture.asset("Assets/Icon/location.svg"),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(255, 197, 111, 0),
                      Color.fromRGBO(189, 223, 255, 0.4),
                    ],
                    stops: [0.0, 1.0],
                  ),
                ),
                child: Column(
                  children: [
                    CustomSearchBar(
                      hintText: AppLocalizations.of(context)!
                          .getTranslatedValue('search_items'),
                    ),
                    // Display categories
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (state is HomeLoaded) {
                          final categories = state.categories;
                          return Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                final category = categories[index];
                                return Container(
                                  margin: EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              blurRadius: 8.0,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: ClipOval(
                                          child: Image.asset(
                                            category.imagePath,
                                            height: 60,
                                            width: 60,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        category.name,
                                        style: FontUtils.getfontStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Positioned(
          //     left: containerWidth / 2 - 150,
          //     bottom: MediaQuery.of(context).size.width / 2 - 180,
          //     child: CustomNavigationBar())
        ],
      ),
    );
  }
}
