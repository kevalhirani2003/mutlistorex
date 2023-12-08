import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multistorex_mobileapp_/utils/consantnames.dart';
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
                      height: containerHeight * 1.30,
                      width: containerWidth * 1,
                      decoration: const BoxDecoration(
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
                                child: const SizedBox(
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
                                    color: const Color.fromRGBO(17, 17, 17, 1),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17.0,
                                    height: 1.2,
                                    letterSpacing: 0.0,
                                  )),
                              const Spacer(),
                            ],
                          ),
                          Container(
                            height: containerHeight * 0.270,
                            width: containerWidth * 0.840,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Colors.black,
                                    ),
                                    height: containerHeight * 0.23,
                                    width: containerWidth * 0.835,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.asset(
                                        subcategories[0].imagePath,
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                                Text(
                                  subcategories[0].name,
                                  style: FontUtils.getfontStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.0,
                                    height: 1.2,
                                    letterSpacing: 0.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: SizedBox(
                              height: containerHeight * 0.8,
                              width: containerWidth * 1,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.68),
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: subcategories.length - 1,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            height: containerHeight * 0.25,
                                            width: containerWidth * 0.8,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              child: Image.asset(
                                                  fit: BoxFit.cover,
                                                  subcategories[index + 1]
                                                      .imagePath),
                                            ),
                                          ),
                                          Text(
                                            subcategories[index + 1].name,
                                            style: FontUtils.getfontStyle(
                                              fontFamily: "Inter",
                                              color:
                                                  const Color.fromRGBO(17, 17, 17, 1),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13.0,
                                              height: 1.2,
                                              letterSpacing: 0.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
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
