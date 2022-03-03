import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/models/locations_filter/atm_filter.dart';
import 'package:rmb_admin/models/locations_filter/branch_service_type.dart';
import 'package:rmb_admin/models/locations_filter/branch_type.dart';
import 'package:rmb_admin/pages/branches/widgets/atm_position.dart';
import 'package:rmb_admin/pages/branches/widgets/city_type_ahead_field.dart';
import 'package:rmb_admin/providers/branches_provider.dart';
import 'package:rmb_admin/providers/cities_provider.dart';
import 'package:rmb_admin/providers/locations_filter_provider.dart';
import 'package:rmb_admin/theme/color_helper.dart';
import 'package:rmb_admin/widgets/buttons/rmb_elevated_button.dart';
import 'package:rmb_admin/widgets/text_form_fields/app_form_field.dart';

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
        appBar: AppBar(
          leading: const BackButton(),
          centerTitle: true,
          title: Text(
            'branch_page.title'.tr(),
            style: const TextStyle(
                color: Colors.white
            ),
          ),
          backgroundColor: ColorHelper.backgroundColor.color,
          elevation: 0.0,
        ),
        backgroundColor: ColorHelper.backgroundColor.color,
        body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: (filterProvider.filtersLoading || citiesProvider.cities.isEmpty) ? const LoadingWidget() :
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: AppTextFormField(
                    label: "branches_page.address_label".tr(),
                    hintText: "branches_page.address_hint".tr(),
                    controller: branchesProvider.addressController,
                    validator: (String? value) {
                      if(value == null || value.isEmpty) {
                        return "branches_page.validation.obligatory_field".tr();
                      }
                    },
                    filled: true,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: AppTextFormField(
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
                    filled: true,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: AppTextFormField(
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
                    filled: true,

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: AppTextFormField(
                    label: "branches_page.name_label".tr(),
                    hintText: "branches_page.name_hint".tr(),
                    controller: branchesProvider.nameController,
                    validator: (String? value) {
                      if(value == null || value.isEmpty) {
                        return "branches_page.validation.obligatory_field".tr();
                      }
                    },
                    filled: true,
                  ),
                ),
                const CityTypeAheadField(),

                AppTextFormField(
                  controller: branchesProvider.contactController,
                  hintText: "branches_page.contact_hint".tr(),
                  filled: true,
                  label: "branches_page.contact_label".tr(),
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
                SizedBox(
                  width: double.maxFinite,
                  child: RMBElevatedTextButton(
                    onPressed: () => branchesProvider.saveChanges(formKey: formKey),
                    text: 'branches_page.save_changes'.tr(),
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - (AppBar().preferredSize.height + kToolbarHeight),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: CircularProgressIndicator(color: ColorHelper.rmbYellow.color,),
        ),
      ),
    );
  }
}







