import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/models/city.dart';
import 'package:rmb_admin/providers/branches_provider.dart';
import 'package:rmb_admin/providers/cities_provider.dart';
import 'package:rmb_admin/theme/color_helper.dart';

@immutable
class CityTypeAheadField extends StatelessWidget {
  const CityTypeAheadField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TypeAheadFormField<City>(
        validator: (String? value) => context.read<CitiesProvider>().validateCity(value!),
        itemBuilder: (_, city) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: Text(
              city.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18
              ),
            ),
          );
        },
        animationStart: 0,
        suggestionsBoxVerticalOffset: 0,
        debounceDuration: Duration.zero,
        animationDuration: Duration.zero,
        onSuggestionSelected: (City city) => context.read<BranchesProvider>().city = city,
        suggestionsCallback: (String pattern) async => context.read<CitiesProvider>().filterCities(pattern),
        suggestionsBoxDecoration: SuggestionsBoxDecoration(color: ColorHelper.backgroundColor.color),
        noItemsFoundBuilder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              "branches_page.validation.no_cities".tr(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18
              ),
            ),
          );
        },
        textFieldConfiguration: TextFieldConfiguration(
            controller: context.watch<BranchesProvider>().cityController,
            style: const TextStyle(
                color: Colors.white
            ),
            decoration: InputDecoration(
                hintText: "branches_page.labels.city".tr(),
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                labelText: "branches_page.labels.city".tr(),
                labelStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                contentPadding: const EdgeInsets.only(left: 20),
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorHelper.rmbYellow.color)),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.3)
            )
        ),
      ),
    );
  }
}
