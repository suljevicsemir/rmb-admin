import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/models/locations_filter/location_filter.dart';
import 'package:rmb_admin/providers/locations_filter_provider.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({Key? key, required this.filter, required this.onDelete}) : super(key: key);

  final LocationFilter filter;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => context.read<LocationsFilterProvider>().selectFilter(filter: filter),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorHelper.rmbYellow.color, width: 3),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      filter.name,
                      style: const TextStyle(
                          color: Colors.white
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.delete, color: ColorHelper.dangerRed.color,),
          onPressed: onDelete
        )
      ],
    );
  }
}
