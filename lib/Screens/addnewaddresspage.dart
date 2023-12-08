import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multistorex_mobileapp_/cubit/addresscubit.dart';

import 'package:multistorex_mobileapp_/utils/consantnames.dart';
import 'package:multistorex_mobileapp_/widgits/Customexpansiontile.dart';
import 'package:multistorex_mobileapp_/widgits/custombutton.dart';
import 'package:multistorex_mobileapp_/widgits/customradiobutton.dart';
import 'package:multistorex_mobileapp_/widgits/customtextfieldfornewaddresspage.dart';
import 'package:multistorex_mobileapp_/widgits/customtextstyle.dart';

class addnewaddressscreen extends StatefulWidget {
  const addnewaddressscreen({super.key});

  @override
  State<addnewaddressscreen> createState() => _addnewaddressscreenState();
}

class _addnewaddressscreenState extends State<addnewaddressscreen> {
  final TextEditingController localityController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phonenoController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  String? selectedState;
  String? selectedcountry;
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    List<String> allStates = [
      'Andhra Pradesh',
      'Arunachal Pradesh',
      'Assam',
      'Bihar',
      'Chhattisgarh',
      'Goa',
      'Gujarat',
      'Haryana',
      'Himachal Pradesh',
      'Jharkhand',
      'Karnataka',
      'Kerala',
      'Madhya Pradesh',
      'Maharashtra',
      'Manipur',
      'Meghalaya',
      'Mizoram',
      'Nagaland',
      'Odisha',
      'Punjab',
      'Rajasthan',
      'Sikkim',
      'Tamil Nadu',
      'Telangana',
      'Tripura',
      'Uttar Pradesh',
      'Uttarakhand',
      'West Bengal',
    ];
    List<String> countries = [
      'Afghanistan',
      'Albania',
      'Algeria',
      'Andorra',
      'Angola',
      'Antigua and Barbuda',
      'Argentina',
      'Armenia',
      'Australia',
      'Austria',
      'Azerbaijan',
      'Bahamas',
      'Bahrain',
      'Bangladesh',
      'Barbados',
      'Belarus',
      'Belgium',
      'Belize',
      'Benin',
      'Bhutan',
      'Bolivia',
      'Bosnia and Herzegovina',
      'Botswana',
      'Brazil',
      'Brunei',
      'Bulgaria',
      'Burkina Faso',
      'Burundi',
      'Cabo Verde',
      'Cambodia',
      'Cameroon',
      'Canada',
      'Central African Republic',
      'Chad',
      'Chile',
      'China',
      'Colombia',
      'Comoros',
      'Congo',
      'Costa Rica',
      'Côte d\'Ivoire',
      'Croatia',
      'Cuba',
      'Cyprus',
      'Czechia',
      'Denmark',
      'Djibouti',
      'Dominica',
      'Dominican Republic',
      'East Timor (Timor-Leste)',
      'Ecuador',
      'Egypt',
      'El Salvador',
      'Equatorial Guinea',
      'Eritrea',
      'Estonia',
      'Eswatini',
      'Ethiopia',
      'Fiji',
      'Finland',
      'France',
      'Gabon',
      'Gambia',
      'Georgia',
      'Germany',
      'Ghana',
      'Greece',
      'Grenada',
      'Guatemala',
      'Guinea',
      'Guinea-Bissau',
      'Guyana',
      'Haiti',
      'Honduras',
      'Hungary',
      'Iceland',
      'India',
      'Indonesia',
      'Iran',
      'Iraq',
      'Ireland',
      'Israel',
      'Italy',
      'Jamaica',
      'Japan',
      'Jordan',
      'Kazakhstan',
      'Kenya',
      'Kiribati',
      'Korea, North',
      'Korea, South',
      'Kosovo',
      'Kuwait',
      'Kyrgyzstan',
      'Laos',
      'Latvia',
      'Lebanon',
      'Lesotho',
      'Liberia',
      'Libya',
      'Liechtenstein',
      'Lithuania',
      'Luxembourg',
      'Madagascar',
      'Malawi',
      'Malaysia',
      'Maldives',
      'Mali',
      'Malta',
      'Marshall Islands',
      'Mauritania',
      'Mauritius',
      'Mexico',
      'Micronesia',
      'Moldova',
      'Monaco',
      'Mongolia',
      'Montenegro',
      'Morocco',
      'Mozambique',
      'Myanmar (Burma)',
      'Namibia',
      'Nauru',
      'Nepal',
      'Netherlands',
      'New Zealand',
      'Nicaragua',
      'Niger',
      'Nigeria',
      'North Macedonia',
      'Norway',
      'Oman',
      'Pakistan',
      'Palau',
      'Panama',
      'Papua New Guinea',
      'Paraguay',
      'Peru',
      'Philippines',
      'Poland',
      'Portugal',
      'Qatar',
      'Romania',
      'Russia',
      'Rwanda',
      'Saint Kitts and Nevis',
      'Saint Lucia',
      'Saint Vincent and the Grenadines',
      'Samoa',
      'San Marino',
      'Sao Tome and Principe',
      'Saudi Arabia',
      'Senegal',
      'Serbia',
      'Seychelles',
      'Sierra Leone',
      'Singapore',
      'Slovakia',
      'Slovenia',
      'Solomon Islands',
      'Somalia',
      'South Africa',
      'South Sudan',
      'Spain',
      'Sri Lanka',
      'Sudan',
      'Sudan, South',
      'Suriname',
      'Sweden',
      'Switzerland',
      'Syria',
      'Taiwan',
      'Tajikistan',
      'Tanzania',
      'Thailand',
      'Togo',
      'Tonga',
      'Trinidad and Tobago',
      'Tunisia',
      'Turkey',
      'Turkmenistan',
      'Tuvalu',
      'Uganda',
      'Ukraine',
      'United Arab Emirates',
      'United Kingdom',
      'United States',
      'Uruguay',
      'Uzbekistan',
      'Vanuatu',
      'Vatican City',
      'Venezuela',
      'Vietnam',
      'Yemen',
      'Zambia',
      'Zimbabwe',
    ];

    double containerHeight = MediaQuery.of(context).size.height;
    double containerWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppConstants.Textcolor,
        ),
        title: Text(
          'New Address',
          style: FontUtils.getfontStyle(
            color: AppConstants.Textcolor,
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
        ),
        backgroundColor: AppConstants.frequetcolor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextFieldForNewAddressPage(
                  controller: usernameController,
                  hintText: "Full Name",
                ),
                SizedBox(
                  height: containerHeight * 0.02,
                ),
                CustomTextFieldForNewAddressPage(
                  controller: phonenoController,
                  hintText: "Phone Number",
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(
                  height: containerHeight * 0.02,
                ),
                CustomTextFieldForNewAddressPage(
                  controller: addressController,
                  hintText: "Address",
                  icon: Icons.location_on,
                ),
                SizedBox(
                  height: containerHeight * 0.02,
                ),
                CustomTextFieldForNewAddressPage(
                  controller: localityController,
                  hintText: "Locality",
                ),
                SizedBox(
                  height: containerHeight * 0.02,
                ),
                CustomTextFieldForNewAddressPage(
                  controller: cityController,
                  hintText: "City",
                ),
                SizedBox(
                  height: containerHeight * 0.02,
                ),
                Container(
                  height: containerHeight * 0.06,
                  width: containerWidth * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(color: Color.fromRGBO(204, 204, 204, 1))),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Text(
                          '${selectedState ?? "States"}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(),
                        CustomContent(
                          selectedState: selectedState,
                          allStates: allStates,
                          onStateChanged: (String? newState) {
                            setState(() {
                              selectedState = newState;
                              print(selectedState);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: containerHeight * 0.02,
                ),
                Container(
                  height: containerHeight * 0.06,
                  width: containerWidth * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(color: Color.fromRGBO(204, 204, 204, 1))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Text(
                          '${selectedcountry ?? "Country"}',
                          style: FontUtils.getfontStyle(
                              color: AppConstants.Textcolor, fontSize: 16),
                        ),
                        Spacer(),
                        CustomContent(
                          selectedState: selectedcountry,
                          allStates: countries,
                          onStateChanged: (String? newState) {
                            setState(() {
                              selectedcountry = newState;
                              print(selectedcountry);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: containerHeight * 0.02,
                ),
                Container(
                  height: containerHeight * 0.09,
                  width: containerWidth * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(color: Color.fromRGBO(204, 204, 204, 1))),
                  child: Column(children: [
                    Text(
                      "Address Type",
                      style: FontUtils.getfontStyle(fontSize: 16),
                    ),
                    Row(
                      children: [
                        CustomRadio(
                          label: "Home",
                          value: "Home",
                          groupValue: selectedOption,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedOption = newValue;
                              print(selectedOption);
                            });
                          },
                        ),
                        SizedBox(
                          width: containerWidth * 0.02,
                        ),
                        CustomRadio(
                          label: "Office",
                          value: "office",
                          groupValue: selectedOption,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedOption = newValue;
                              print(selectedOption);
                            });
                          },
                        ),
                        SizedBox(
                          width: containerWidth * 0.02,
                        ),
                        CustomRadio(
                          label: "Other",
                          value: "other",
                          groupValue: selectedOption,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedOption = newValue;
                              print(selectedOption);
                            });
                          },
                        ),
                      ],
                    )
                  ]),
                ),
                CustomContainerButton(
                    text: "Update",
                    onPressed: () {
                      context.read<ManageAddressCubit>().addAddress(AddressData(
                            fullName: usernameController.text,
                            phoneNumber: phonenoController.text,
                            address: addressController.text,
                            locality: localityController.text,
                            city: cityController.text,
                            selectedCountry: selectedcountry,
                            selectedState: selectedState,
                            selectedOption: selectedOption,
                          ));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
