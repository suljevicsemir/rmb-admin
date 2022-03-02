import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/pages/cities/city_item.dart';
import 'package:rmb_admin/pages/cities/widgets/form_row.dart';
import 'package:rmb_admin/providers/cities_provider.dart';
import 'package:rmb_admin/theme/color_helper.dart';
import 'package:rmb_admin/widgets/text_form_fields/app_form_field.dart';

class CitiesPage extends StatelessWidget {
  const CitiesPage({Key? key}) : super(key: key);

  static const String route = '/cities';

  @override
  Widget build(BuildContext context) {
    final CitiesProvider provider = Provider.of<CitiesProvider>(context);

    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor.color,
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: ColorHelper.backgroundColor.color,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              CitiesFormRow(
                label: 'cities_page.add_city_label'.tr(),
                textFormField: AppTextFormField(
                  controller: provider.createController,
                  filled: true,
                  hintText: 'cities_page.city_name_hint'.tr(),
                ),
                icons: IconButton(
                  onPressed: () => provider.createCity(),
                  icon: Icon(Icons.save, color: ColorHelper.rmbYellow.color,),
                  splashRadius: 20,
                ),
              ),
              CitiesFormRow(
                label: 'cities_page.edit_section'.tr(),
                textFormField: AppTextFormField(
                  controller: provider.editingController,
                  filled: true,
                  hintText: 'cities_page.select_city'.tr(),
                ),
                icons: Row(
                  children: [
                    IconButton(
                      onPressed: () => provider.editCity(),
                      icon: const Icon(Icons.done, color: Colors.green,),
                      splashRadius: 20,
                    ),
                    IconButton(
                      onPressed: () => provider.deleteCity(),
                      icon: Icon(Icons.delete, color: ColorHelper.dangerRed.color,),
                      splashRadius: 20,
                    )
                  ],
                ),
              ),
              CitiesFormRow(
                label: 'cities_page.filter_section'.tr(),
                textFormField: AppTextFormField(
                  controller: provider.queryController,
                  onChanged: (String? value) => provider.queryCities(),
                  filled: true,
                  hintText: 'cities_page.filter_section'.tr(),
                ),
                icons: IconButton(
                  onPressed: () => provider.editCity(),
                  icon: const Icon(Icons.done, color: Colors.green,),
                  splashRadius: 20,
                ),
              ),

              if(provider.cities.isEmpty) const CircularProgressIndicator() else
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    shrinkWrap: true,
                    children: provider.filteredCities.map((e) => CityListItem(city: e)).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
