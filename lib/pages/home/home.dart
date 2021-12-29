

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/pages/home/widgets/sidebar/expendable_item.dart';
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
                icon: Icons.policy,
                title: "Legal elements",
              ),
              SidebarExpendableItem(
                icon: Icons.article,
                title: "News"
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
