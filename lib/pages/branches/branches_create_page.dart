import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/models/city.dart';
import 'package:rmb_admin/models/locations_filter/atm_filter.dart';
import 'package:rmb_admin/models/locations_filter/branch_service_type.dart';
import 'package:rmb_admin/models/locations_filter/branch_type.dart';
import 'package:rmb_admin/pages/branches/widgets/atm_position.dart';
import 'package:rmb_admin/pages/branches/widgets/branch_textual_field.dart';
import 'package:rmb_admin/providers/branches_provider.dart';
import 'package:rmb_admin/providers/cities_provider.dart';
import 'package:rmb_admin/providers/locations_filter_provider.dart';
import 'package:rmb_admin/theme/color_helper.dart';
import 'package:rmb_admin/widgets/buttons/rmb_elevated_button.dart';

class BranchesInsertPage extends StatefulWidget {
  const BranchesInsertPage({Key? key}) : super(key: key);

  static const String route = '/branches';

  @override
  _BranchesInsertPageState createState() => _BranchesInsertPageState();
}

class _BranchesInsertPageState extends State<BranchesInsertPage> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final BranchesProvider branchesProvider = context.watch<BranchesProvider>();
    final LocationsFilterProvider filterProvider = context.watch<LocationsFilterProvider>();
    final CitiesProvider citiesProvider = context.watch<CitiesProvider>();
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: ColorHelper.backgroundColor.color,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(150, 100, 150, 0),
            child: SafeArea(
              child: (filterProvider.filtersLoading || citiesProvider.cities.isEmpty) ? const CircularProgressIndicator() :
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        'assets/raiffeisen_logo.jpg',
                        width: 350,
                        height: 250,
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "branches_page.headline_desc".tr(),
                            style: const TextStyle(
                                fontSize: 45,
                                color: Colors.white
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                                text: "branches_page.got_questions".tr(),
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                                children: [
                                  TextSpan(
                                      text: "branches_page.help_center".tr(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20
                                      ),
                                      recognizer: TapGestureRecognizer()..onTap = () {

                                      }
                                  )
                                ]
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  BranchTextualField(
                    label: "branches_page.address_label".tr(),
                    hintText: "branches_page.address_hint".tr(),
                    controller: branchesProvider.addressController,
                    validator: (String? value) {
                      if(value == null || value.isEmpty) {
                        return "branches_page.validation.obligatory_field".tr();
                      }
                    },
                  ),
                  BranchTextualField(
                    label: "branches_page.latitude_label".tr(),
                    hintText: "branches_page.latitude_hint".tr(),
                    controller: branchesProvider.latitudeController,
                    validator: (String? value) {
                      if(value == null || value.isEmpty) {
                        return "branches_page.validation.obligatory_field".tr();
                      }
                      if(double.tryParse(value) == null) {
                        return "branches_page.validation.not_a_number".tr();
                      }
                    },
                  ),
                  BranchTextualField(
                    label: "branches_page.longitude_label".tr(),
                    hintText: "branches_page.longitude_hint".tr(),
                    controller: branchesProvider.longitudeController,
                    validator: (String? value) {
                      if(value == null || value.isEmpty) {
                        return "branches_page.validation.obligatory_field".tr();
                      }
                      if(double.tryParse(value) == null) {
                        return "branches_page.validation.not_a_number".tr();
                      }
                    },
                  ),
                  BranchTextualField(
                    label: "branches_page.name_label".tr(),
                    hintText: "branches_page.name_hint".tr(),
                    controller: branchesProvider.nameController,
                    validator: (String? value) {
                      if(value == null || value.isEmpty) {
                        return "branches_page.validation.obligatory_field".tr();
                      }
                    },
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 90,
                        child: Text(
                          "branches_page.city_label".tr(),
                          style: const TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                      DropdownButton<City>(
                        dropdownColor: Colors.black87,
                        hint: Text(
                          "branches_page.labels.city".tr(),
                          style: const TextStyle(
                              color: Colors.white
                          ),
                        ),
                        items: citiesProvider.cities.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e.name,
                              style: const TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (City? city) => branchesProvider.city = city,
                        value: branchesProvider.city,
                      ),
                    ],
                  ),
                  BranchTextualField(
                    label: "branches_page.contact_label".tr(),
                    hintText: "branches_page.contact_hint".tr(),
                    controller: branchesProvider.contactController,
                    validator: (String? value) {
                      if(value == null || value.isEmpty) {
                        return "branches_page.validation.obligatory_field".tr();
                      }
                      if(value[0] != '+' || value.length <= 9) {
                        return "branches_page.validation.phone_number".tr();
                      }
                      if(value.substring(1).contains(RegExp(r'^[a-zA-Z]+$'))) {
                        return "branches_page.validation.phone_number".tr();
                      }
                    },
                  ),
                  Row(
                    children: [
                      Text("Working hours"),

                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 140,
                        child: Text(
                          "branches_page.branch_type_label".tr(),
                          style: const TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                      DropdownButton<BranchType>(
                        dropdownColor: Colors.black87,
                        hint: Text(
                          "branches_page.labels.branch_type".tr(),
                          style: const TextStyle(
                              color: Colors.white
                          ),
                        ),
                        items: filterProvider.branchTypes!.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e.name,
                              style: const TextStyle(
                                color: Colors.white
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (BranchType? branchType) => branchesProvider.branchType = branchType,
                        value: branchesProvider.branchType,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 140,
                        child: Text(
                          "branches_page.branch_service_type_label".tr(),
                          style: const TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                      DropdownButton<BranchServiceType>(
                        dropdownColor: Colors.black87,
                        hint: Text(
                          "branches_page.labels.branch_service_type".tr(),
                          style: const TextStyle(
                              color: Colors.white
                          ),
                        ),
                        items: filterProvider.branchServiceTypes!.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e.name,
                              style: const TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (BranchServiceType? branchServiceType) => branchesProvider.branchServiceType = branchServiceType,
                        value: branchesProvider.branchServiceType,
                      ),
                    ],
                  ),
                  const ATMPosition(),
                  Row(
                    children: [
                      SizedBox(
                        width: 90,
                        child: Text(
                          "branches_page.atm_filter_label".tr(),
                          style: const TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                      DropdownButton<ATMFilter>(
                        dropdownColor: Colors.black87,
                        hint: Text(
                          "branches_page.labels.atm_filter".tr(),
                          style: const TextStyle(
                              color: Colors.white
                          ),
                        ),
                        items: filterProvider.atmFilters!.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e.name,
                              style: const TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (ATMFilter? atmFilter) => branchesProvider.atmFilter = atmFilter,
                        value: branchesProvider.atmFilter,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50,),
                  RMBElevatedTextButton(
                    onPressed: () => branchesProvider.create(formKey: formKey),
                    text: 'CREATE',
                  ),
                  const SizedBox(height: 50,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}






