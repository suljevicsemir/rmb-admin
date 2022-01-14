

import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/pages/faq/pages/faq_page.dart';
import 'package:rmb_admin/pages/home/widgets/sidebar/expanded_item.dart';
import 'package:rmb_admin/pages/home/widgets/sidebar/expendable_item.dart';
import 'package:rmb_admin/pages/home/widgets/sidebar/section_title.dart';
import 'package:rmb_admin/repositories/navigation_repo.dart';
import 'package:rmb_admin/repositories/secure_storage_repo.dart';
import 'package:rmb_admin/theme/color_helper.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String route = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool expanded = true;

  void tapOnSidebar(BuildContext context) {
    setState(() {
      expanded = !expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                locator.get<SecureStorageRepo>().deleteAll();
              },
              child: Text("LOGOUT"),
            ),
            TextButton(
              onPressed: () {
                locator.get<SecureStorageRepo>().getAccessToken();
              },
              child: Text("REFRESH"),
            )
            ]
      ),
      drawer: Drawer(
        child: Container(
          color: ColorHelper.dashboardBlue.color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SectionTitle(title: "home.drawer.section_title_general".tr()),
              SidebarExpendableItem(
                icon: Icons.home,
                title: "home.drawer.section_item_dashboard".tr(),
              ),
              SidebarExpendableItem(
                icon: Icons.location_on,
                title: "home.drawer.section_item_cities".tr(),
                children: <ExpandedSidebarItem>[
                  ExpandedSidebarItem(title: "home.drawer.section_item_cities_list".tr(), icon: Icons.map),
                  ExpandedSidebarItem(title: "home.drawer.section_item_cities_create".tr(), icon: Icons.location_city)
                ],
              ),
              SidebarExpendableItem(
                icon: Icons.atm,
                title: "home.drawer.section_item_atms".tr(),
                children: <ExpandedSidebarItem>[
                  ExpandedSidebarItem(title: "home.drawer.section_item_atms_list".tr(), icon: Icons.view_list,),
                  ExpandedSidebarItem(title: "home.drawer.section_item_atms_create".tr(), icon: Icons.create,)
                ],
              ),
              SidebarExpendableItem(
                icon: Icons.design_services,
                title: "home.drawer.section_item_services".tr(),
              ),
              SidebarExpendableItem(
                icon: Icons.article,
                title: "home.drawer.section_item_news".tr(),
                children: <Text>[
                  Text("Find about latest news")
                ],
              ),
              SectionTitle(title: "home.drawer.section_title_legal".tr()),
              SidebarExpendableItem(
                icon: Icons.policy,
                title: "home.drawer.section_item_terms_of_use".tr(),
                hasArrow: false,
              ),
              SidebarExpendableItem(
                icon: Icons.policy,
                title: "home.drawer.section_item_privacy_policy".tr(),
                hasArrow: false,
              ),
              SidebarExpendableItem(
                icon: Icons.quiz,
                title: "home.drawer.section_item_faq".tr(),
                hasArrow: false,
                onTap: () => locator.get<NavigationRepo>().navigateTo(FaqPage.route),
              ),
              SidebarExpendableItem(
                icon: Icons.lightbulb,
                title: "home.drawer.section_item_about_us".tr(),
                hasArrow: false,
              ),
              SectionTitle(title: "home.drawer.section_title_app_settings".tr()),
              SidebarExpendableItem(
                icon: Icons.dark_mode,
                title: "home.drawer.section_item_dark_mode".tr(),
                hasArrow: false,
              ),
              SidebarExpendableItem(
                icon: Icons.person,
                title: "home.drawer.section_item_account_settings".tr(),
                children: [
                  ExpandedSidebarItem(
                    title: "home.drawer.section_item_change_password".tr(),
                    icon: Icons.password,
                  ),
                  ExpandedSidebarItem(
                    title: "home.drawer.section_item_language".tr(),
                    icon: Icons.language,
                  )
                ],
              ),
              SidebarExpendableItem(
                icon: Icons.logout,
                title: "home.drawer.section_item_log_out".tr(),
                hasArrow: false,
              )


            ],
          ),
        ),
      ),
      appBar: AppBar(

        actions: [

        ],
      ),
      body: Container(child: getMap())
    );
  }
}



Widget getMap() {
  String htmlId = "7";

  final myLatlng = new LatLng(30.2669444, -97.7427778);

  final mapOptions = new MapOptions()
    ..zoom = 8
    ..center = new LatLng(30.2669444, -97.7427778);

// ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final elem = html.DivElement()
      ..id = htmlId
      ..style.width = "100%"
      ..style.height = "100%"
      ..style.border = 'none';

    GMap(elem, mapOptions);

    return elem;
  });

  return HtmlElementView(viewType: htmlId);
}
