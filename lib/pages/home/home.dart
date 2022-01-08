

import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'package:rmb_admin/pages/home/widgets/sidebar/expanded_item.dart';
import 'package:rmb_admin/pages/home/widgets/sidebar/expendable_item.dart';
import 'package:rmb_admin/pages/home/widgets/sidebar/section_title.dart';
import 'package:rmb_admin/theme/color_helper.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
                title: "home.drawer.section_item_dashboard",
                children: [
                  ExpandedSidebarItem(
                    title: "Eleven",
                    icon: Icons.eleven_mp,
                  ),
                  ExpandedSidebarItem(
                    title: "Eleven",
                    icon: Icons.eleven_mp,
                  )
                ],
              ),
              SidebarExpendableItem(
                icon: Icons.location_on,
                title: "Cities",
                children: <ExpandedSidebarItem>[
                  ExpandedSidebarItem(title: "List, edit, delete cities", icon: Icons.map),
                  ExpandedSidebarItem(title: "Create a new city", icon: Icons.location_city)
                ],
              ),
              SidebarExpendableItem(
                icon: Icons.atm,
                title: "ATMS",
                children: <ExpandedSidebarItem>[
                  ExpandedSidebarItem(title: "List, edit, delete ATMs", icon: Icons.view_list,),
                  ExpandedSidebarItem(title: "Create a new ATM", icon: Icons.create,)
                ],
              ),
              SidebarExpendableItem(
                icon: Icons.design_services,
                title: "Services",
              ),
              SidebarExpendableItem(
                icon: Icons.article,
                title: "News",
                children: <Text>[
                  Text("Find about latest news")
                ],
              ),
              SectionTitle(title: "Legal"),
              SidebarExpendableItem(
                icon: Icons.policy,
                title: "Terms of use",
                hasArrow: false,
              ),
              SidebarExpendableItem(
                icon: Icons.policy,
                title: "Privacy policy",
                hasArrow: false,
              ),
              SidebarExpendableItem(
                icon: Icons.quiz,
                title: "FAQ",
                hasArrow: false,
              ),
              SidebarExpendableItem(
                icon: Icons.lightbulb,
                title: "About us",
                hasArrow: false,
              ),
              SectionTitle(title: "Application settings"),
              SidebarExpendableItem(
                icon: Icons.dark_mode,
                title: "Dark mode",
                hasArrow: false,
              ),
              SidebarExpendableItem(
                icon: Icons.person,
                title: "Account settings",
                children: [
                  ExpandedSidebarItem(
                    title: "Change password",
                    icon: Icons.password,
                  ),
                  ExpandedSidebarItem(
                    title: "Language selection",
                    icon: Icons.language,
                  )
                ],
              ),
              SidebarExpendableItem(
                icon: Icons.logout,
                title: "Log out",
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
