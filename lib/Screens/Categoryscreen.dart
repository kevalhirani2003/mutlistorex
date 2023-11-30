import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multistorex_mobileapp_/Screens/subcategoryscreen.dart';
import 'package:multistorex_mobileapp_/apps/app_locationzaltion.dart';

import 'package:multistorex_mobileapp_/consantnames.dart';
import 'package:multistorex_mobileapp_/cubit/categorycubit.dart';
import 'package:multistorex_mobileapp_/widgits/customappbar.dart';
import 'package:multistorex_mobileapp_/widgits/customtextstyle.dart';

class Categoryscreen extends StatefulWidget {
  const Categoryscreen({super.key});

  @override
  State<Categoryscreen> createState() => _CategoryscreenState();
}

class _CategoryscreenState extends State<Categoryscreen> {
  @override
  Widget build(BuildContext context) {
    Category selectedCategory;
    Future<void> loadCategories() async {
      try {
        await context.read<CategoryCubit>().loadCategoriesforcategoriesscreen();
      } catch (e) {
        print('Error loading categories: $e');
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadCategories();
    });

    double containerHeight = MediaQuery.of(context).size.height;
    double containerWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: containerHeight * 0.03),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              containerHeight: containerHeight * 1,
              containerWidth: containerWidth,
            ),
            Container(
                height: containerHeight,
                width: containerWidth * 1,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: AppConstants.colorList)),
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: containerHeight * 0.04,
                          width: containerWidth * 0.82,
                          child: Text(
                            AppLocalizations.of(context)!
                                .getTranslatedValue('choose_you_new_look'),
                            style: FontUtils.getfontStyle(
                                color: Colors.black,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        BlocBuilder<CategoryCubit, CategoryState>(
                            builder: (context, state) {
                          print('Builder called with state: $state');
                          if (state is CategoriesLoaded) {
                            final categories = state.categories;
                            return Container(
                              height: containerHeight * 1.5,
                              width: containerWidth * 0.9,
                              child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 0.75,
                                          crossAxisCount: 2),
                                  itemCount: categories.length,
                                  itemBuilder: (context, index) {
                                    final category = categories[index];

                                    return Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<CategoryCubit>()
                                              .setSelectedCategory(category.id);
                                          selectedCategory = category;
                                          print(
                                              'Selected category: $selectedCategory');

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SubcategoryScreen(
                                                selectedCategory:
                                                    selectedCategory,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white),
                                            height: 100,
                                            width:
                                                200, // Adjust width as needed
                                            child: Column(
                                              children: [
                                                Container(
                                                  height:
                                                      190, // Adjust height as needed
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          category.imagePath),
                                                      fit: BoxFit.cover,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                                SizedBox(height: 5.0),
                                                Text(
                                                  category.name,
                                                  style: FontUtils.getfontStyle(
                                                      color: Colors.black,
                                                      fontSize: 13.0,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            )),
                                      ),
                                    );
                                  }),
                            );
                          } else {
                            print(state.toString() + "else");
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        })
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
