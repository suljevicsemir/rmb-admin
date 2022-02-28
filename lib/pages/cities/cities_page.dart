import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/pages/cities/city_item.dart';
import 'package:rmb_admin/providers/cities_provider.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class CitiesPage extends StatefulWidget {
  const CitiesPage({Key? key}) : super(key: key);

  static const String route = '/cities';

  @override
  _CitiesPageState createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage> {

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final CitiesProvider provider = Provider.of<CitiesProvider>(context);

    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor.color,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(150, 20, 150, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Image.network(
            //       'assets/raiffeisen_logo.jpg',
            //       width: 350,
            //       height: 250,
            //     ),
            //     const Spacer(),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         Text(
            //           "cities_page.headline_desc".tr(),
            //           style: const TextStyle(
            //               fontSize: 45,
            //               color: Colors.white
            //           ),
            //         ),
            //         RichText(
            //           text: TextSpan(
            //               text: "cities_page.got_questions".tr(),
            //               style: const TextStyle(
            //                 fontSize: 25,
            //                 color: Colors.white,
            //               ),
            //               children: [
            //                 TextSpan(
            //                     text: "cities_page.help_center".tr(),
            //                     style: const TextStyle(
            //                       color: Colors.white,
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 20
            //                     ),
            //                     recognizer: TapGestureRecognizer()..onTap = () {
            //
            //                     }
            //                 )
            //               ]
            //           ),
            //         )
            //       ],
            //     )
            //   ],
            // ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 130,
                  child: Text(
                    'cities_page.add_city_label'.tr(),
                    style: TextStyle(
                        color: ColorHelper.rmbYellow.color,
                        fontSize: 20
                    ),
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: provider.createController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                        fillColor: Colors.grey.withOpacity(0.3),
                        filled: true,
                        hintText: 'cities_page.city_name_hint'.tr(),
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorHelper.rmbYellow.color))
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => provider.createCity(),
                  icon: Icon(Icons.save, color: ColorHelper.rmbYellow.color,),
                  splashRadius: 20,
                )
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 130,
                  child: Text(
                    'cities_page.edit_section'.tr(),
                    style: TextStyle(
                        color: ColorHelper.rmbYellow.color,
                        fontSize: 18
                    ),
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: provider.editingController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                        fillColor: Colors.grey.withOpacity(0.3),
                        filled: true,
                        hintText: 'cities_page.select_city'.tr(),
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorHelper.rmbYellow.color))
                    ),
                  ),
                ),
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
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 130,
                  child: Text(
                    'cities_page.filter_section'.tr(),
                    style: TextStyle(
                        color: ColorHelper.rmbYellow.color,
                        fontSize: 18
                    ),
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: provider.queryController,
                    onChanged: (String? value) => provider.queryCities(),
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                      fillColor: Colors.grey.withOpacity(0.3),
                      filled: true,
                      hintText: 'cities_page.filter_section'.tr(),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorHelper.rmbYellow.color))
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => provider.editCity(),
                  icon: const Icon(Icons.done, color: Colors.green,),
                  splashRadius: 20,
                ),
              ],
            ),
            const SizedBox(height: 20,),
            if(provider.cities.isEmpty) const CircularProgressIndicator() else
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 0.8 * MediaQuery.of(context).size.width,
                    child: GridView.count(
                      crossAxisSpacing: 20,
                      shrinkWrap: true,
                      crossAxisCount: 6,
                      childAspectRatio: 3.6,
                      children: provider.filteredCities.map((e) => CityListItem(city: e)).toList(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
