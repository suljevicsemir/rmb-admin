

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/pages/home/widgets/sidebar/expendable_item.dart';
import 'package:rmb_admin/pages/home/widgets/sidebar/section_title.dart';
import 'package:rmb_admin/providers/home_page_provider.dart';
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
              SectionTitle(title: "General"),
              SidebarExpendableItem(
                icon: Icons.home,
                title: "Dashboard",
              ),
              SidebarExpendableItem(
                icon: Icons.location_on,
                title: "Cities",
              ),
              SidebarExpendableItem(
                icon: Icons.atm,
                title: "ATMS",
              ),
              SidebarExpendableItem(
                icon: Icons.design_services,
                title: "Services",
              ),
              SidebarExpendableItem(
                icon: Icons.article,
                title: "News"
              ),
              SectionTitle(title: "Legal"),
              SidebarExpendableItem(
                icon: Icons.policy,
                title: "Terms of use",
              ),
              SidebarExpendableItem(
                icon: Icons.policy,
                title: "Privacy policy",
              ),
              SidebarExpendableItem(
                icon: Icons.lightbulb,
                title: "About us",
              ),
              SectionTitle(title: "Application settings"),
              SidebarExpendableItem(
                icon: Icons.dark_mode,
                title: "Dark mode",
              ),
              SidebarExpendableItem(
                icon: Icons.person,
                title: "Account settings",
              ),
              SidebarExpendableItem(
                icon: Icons.logout,
                title: "Log out",
              )


            ],
          ),
        ),
      ),
      appBar: AppBar(

        actions: [

        ],
      ),
    );
  }
}
