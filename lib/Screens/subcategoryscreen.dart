import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multistorex_mobileapp_/consantnames.dart';
import 'package:multistorex_mobileapp_/cubit/categorycubit.dart';
import 'package:multistorex_mobileapp_/cubit/subcategorycubit.dart';
import 'package:multistorex_mobileapp_/widgits/customappbar.dart';
import 'package:multistorex_mobileapp_/widgits/customtextstyle.dart';

class SubcategoryScreen extends StatelessWidget {
  final Category selectedCategory;

  const SubcategoryScreen({
    Key? key,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height;
    double containerWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (_) => SubcategoryCubit()..loadSubcategories(selectedCategory.id),
      child: BlocBuilder<SubcategoryCubit, SubcategoryState>(
          builder: (context, state) {
        if (state is SubcategoriesLoaded) {
          final subcategories = state.subcategories;
          print(
              'Subcategories: $subcategories, length: ${subcategories.length}');
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: containerHeight * 0.033),
                child: Column(
                  children: [
                    CustomAppBar(
                      containerHeight: containerHeight,
                      containerWidth: containerWidth,
                    ),
                    Container(
                      height: containerHeight * 1.17,
                      width: containerWidth * 1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: AppConstants.colorList,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Text(selectedCategory.name,
                                  style: FontUtils.getfontStyle(
                                    fontFamily: "Libre Baskerville",
                                    color: Color.fromRGBO(17, 17, 17, 1),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17.0,
                                    height: 1.2,
                                    letterSpacing: 0.0,
                                  )),
                              Spacer(),
                            ],
                          ),
                          SizedBox(
                            height: containerHeight * 0.02,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  height: containerHeight * 0.3,
                                  width: containerWidth * 0.8,
                                  child:
                                      Image.asset(subcategories[0].imagePath),
                                ),
                                Text(
                                  subcategories[0].name,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: containerHeight * 0.8,
                            width: containerWidth * 1,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.72),
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: subcategories.length - 1,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          height: containerHeight * 0.2,
                                          width: containerWidth * 0.8,
                                          child: Image.asset(
                                              subcategories[index + 1]
                                                  .imagePath),
                                        ),
                                        Text(
                                          subcategories[index].name,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
