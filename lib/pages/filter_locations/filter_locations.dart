
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/pages/filter_locations/filter_item.dart';
import 'package:rmb_admin/pages/filter_locations/widgets/filter_save_button.dart';
import 'package:rmb_admin/providers/locations_filter_provider.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class FilterLocations extends StatefulWidget {
  const FilterLocations({Key? key}) : super(key: key);

  static const String route = '/filter_locations';

  @override
  _FilterLocationsState createState() => _FilterLocationsState();
}

class _FilterLocationsState extends State<FilterLocations> {
  @override
  Widget build(BuildContext context) {
    final LocationsFilterProvider provider = context.watch<LocationsFilterProvider>();
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor.color,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(150, 100, 150, 0),
        child: SingleChildScrollView(
          child: Column(
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
                        "filter_locations_page.headline_desc".tr(),
                        style: const TextStyle(
                            fontSize: 45,
                            color: Colors.white
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            text: "filter_locations_page.got_questions".tr(),
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: "filter_locations_page.help_center".tr(),
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
              if(provider.filtersLoading) const CircularProgressIndicator() else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: provider.branchTypeControllerBj,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                            fillColor: Colors.grey.withOpacity(0.3),
                            filled: true,
                            hintText: 'filter_locations_page.branch_type_hint_bj'.tr(),
                            labelText: 'filter_locations_page.branch_type_hint_bj'.tr(),
                            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorHelper.rmbYellow.color))
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: provider.branchTypeControllerEn,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                            fillColor: Colors.grey.withOpacity(0.3),
                            filled: true,
                            hintText: 'filter_locations_page.branch_type_hint_en'.tr(),
                            labelText: 'filter_locations_page.branch_type_hint_en'.tr(),
                            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorHelper.rmbYellow.color))
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      FilterSaveButton(
                        onPressed: () => provider.createBranchType()
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: 250,
                        child:ListView(
                            shrinkWrap: true,
                            children: provider.branchTypes!.map((e) => FilterItem(
                              filter: e,
                              onDelete: () => provider.deleteBranchType(branchType: e),
                            )).toList()
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: provider.branchServiceTypeControllerBj,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                              fillColor: Colors.grey.withOpacity(0.3),
                              filled: true,
                              hintText: 'filter_locations_page.branch_service_type_hint_bj'.tr(),
                              labelText: 'filter_locations_page.branch_service_type_hint_bj'.tr(),
                              enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorHelper.rmbYellow.color))
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: provider.branchServiceTypeControllerEn,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                              fillColor: Colors.grey.withOpacity(0.3),
                              filled: true,
                              hintText: 'filter_locations_page.branch_service_type_hint_en'.tr(),
                              labelText: 'filter_locations_page.branch_service_type_hint_en'.tr(),
                              enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorHelper.rmbYellow.color))
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      FilterSaveButton(
                        onPressed: () => provider.createBranchServiceType()
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: 250,
                        child:ListView(
                          shrinkWrap: true,
                          children: provider.branchServiceTypes!.map((e) => FilterItem(
                            filter: e,
                            onDelete: () => provider.deleteBranchServiceType(branchServiceType: e),
                          )).toList()
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: provider.atmTypeControllerBj,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                            fillColor: Colors.grey.withOpacity(0.3),
                            filled: true,
                            hintText: 'filter_locations_page.branch_service_type_hint_bj'.tr(),
                            labelText: 'filter_locations_page.branch_service_type_hint_bj'.tr(),
                            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorHelper.rmbYellow.color))
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: provider.atmTypeControllerEn,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                            fillColor: Colors.grey.withOpacity(0.3),
                            filled: true,
                            hintText: 'filter_locations_page.branch_service_type_hint_en'.tr(),
                            labelText: 'filter_locations_page.branch_service_type_hint_en'.tr(),
                            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorHelper.rmbYellow.color))
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      FilterSaveButton(
                        onPressed: () => provider.createAtmType()
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: 250,
                        child:ListView(
                            shrinkWrap: true,
                            children: provider.branchServiceTypes!.map((e) => FilterItem(
                              filter: e,
                              onDelete: () => provider.deleteATMService(),
                            )).toList()
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
