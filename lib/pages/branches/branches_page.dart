
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rmb_admin/models/city.dart';
import 'package:rmb_admin/models/locations_filter/atm_filter.dart';
import 'package:rmb_admin/models/locations_filter/branch_service_type.dart';
import 'package:rmb_admin/models/locations_filter/branch_type.dart';

class BranchesInsertPage extends StatefulWidget {
  const BranchesInsertPage({Key? key}) : super(key: key);

  static const String route = '/branches';

  @override
  _BranchesInsertPageState createState() => _BranchesInsertPageState();
}

class _BranchesInsertPageState extends State<BranchesInsertPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      "cities_page.headline_desc".tr(),
                      style: const TextStyle(
                          fontSize: 45,
                          color: Colors.white
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          text: "cities_page.got_questions".tr(),
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                                text: "cities_page.help_center".tr(),
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
            Text("Location"),

            Row(
              children: [
                Text("Adresa"),
                TextField(

                ),
              ],
            ),
            Row(
              children: [
                Text("latitude"),
                TextField(

                ),
              ],
            ),
            Row(
              children: [
                Text("longitude"),
                TextField(

                ),
              ],
            ),
            Row(
              children: [
                Text("name"),
                TextField(

                )
              ],
            ),
            DropdownButton<City>(
              items: [

              ],
              onChanged: (City? city) {

              },
            ),
            Row(
              children: [
                Text("Contact"),
                TextField(

                )
              ],
            ),
            Row(
              children: [
                Text("Working hours"),
                TextField(

                )
              ],
            ),
            DropdownButton<BranchType>(
              items: [

              ],
              onChanged: (BranchType? branchType) {

              },
            ),
            DropdownButton<BranchServiceType>(
              items: [

              ],
              onChanged: (BranchServiceType? branchServiceType) {

              },
            ),
            Row(
              children: [
                Text("ATM type"),
                Radio(
                  value: false,
                  groupValue: true,
                  onChanged: (bool? value) {

                  },
                ),
                Radio(
                  value: false,
                  groupValue: true,
                  onChanged: (bool? value) {

                  },
                )
              ],
            ),
            DropdownButton<ATMFilter>(
              items: [

              ],
              onChanged: (ATMFilter? branchServiceType) {

              },
            ),





          ],
        ),
      ),
    );
  }
}

