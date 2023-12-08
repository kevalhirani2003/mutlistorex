import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multistorex_mobileapp_/cubit/addresscubit.dart';
import 'package:multistorex_mobileapp_/utils/consantnames.dart';
import 'package:multistorex_mobileapp_/widgits/customfloatingbutton.dart';
import 'package:multistorex_mobileapp_/widgits/customtextstyle.dart';

class ManageAddress extends StatelessWidget {
  const ManageAddress({Key? key});

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppConstants.Textcolor,
        ),
        title: Text(
          'Manage Address',
          style: FontUtils.getfontStyle(
            color: AppConstants.Textcolor,
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
        ),
        backgroundColor: AppConstants.frequetcolor,
      ),
      body: BlocBuilder<ManageAddressCubit, List<AddressData>>(
        builder: (context, addresses) {
          return addresses.isEmpty
              ? Center(
                  child: Text('No addresses available'),
                )
              : ListView.builder(
                  itemCount: addresses.length,
                  itemBuilder: (context, index) {
                    AddressData addressData = addresses[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Container(
                        height: containerHeight * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                              offset: Offset(0, 4),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          addressData.fullName + ",",
                                          style: FontUtils.getfontStyle(
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text(
                                          addressData.phoneNumber,
                                          style: FontUtils.getfontStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: containerHeight * 0.006,
                                    ),
                                    Text(
                                      addressData.address,
                                      style: FontUtils.getfontStyle(
                                        color: Color.fromRGBO(102, 102, 102, 1),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: SvgPicture.asset(
                                            addressData.isDefault
                                                ? 'Assets/Icon/empty_check_box.svg'
                                                : 'Assets/Icon/check_box.svg',
                                            colorFilter: addressData.isDefault
                                                ? const ColorFilter.mode(
                                                    Color.fromRGBO(
                                                        250, 103, 129, 1),
                                                    BlendMode.srcIn,
                                                  )
                                                : const ColorFilter.mode(
                                                    Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    BlendMode.srcIn,
                                                  ),
                                          ),
                                        ),
                                        Text(
                                          "Mark as Default",
                                          style: FontUtils.getfontStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: containerHeight * 0.025,
                                      width: containerHeight * 0.025,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: SvgPicture.asset(
                                          "Assets/Icon/Edit.svg"),
                                    ),
                                    SizedBox(
                                      height: containerHeight * 0.01,
                                    ),
                                    Container(
                                      height: containerHeight * 0.025,
                                      width: containerHeight * 0.025,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: SvgPicture.asset(
                                          "Assets/Icon/Trash.svg"),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: customfloatingbutton(),
    );
  }
}
