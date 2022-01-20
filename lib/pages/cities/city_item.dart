
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/models/city.dart';
import 'package:rmb_admin/providers/cities_provider.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class CityListItem extends StatelessWidget {

  const CityListItem({
    Key? key,
    required this.city
  }) : super(key: key);

  final City city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => context.read<CitiesProvider>().selectCity(city: city),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorHelper.rmbYellow.color, width: 3),
                borderRadius: BorderRadius.circular(20)
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                city.name,
                style: const TextStyle(
                  color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
