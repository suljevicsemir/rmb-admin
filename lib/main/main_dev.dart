

import 'package:flutter/cupertino.dart';
import 'package:rmb_admin/main/config/flavor_config.dart';
import 'package:rmb_admin/main/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    flavor: Flavor.dev,
    flavorValues: FlavorValues(
      baseUrl: "http://rmbcloneapi.azurewebsites.net/api/",
      appName: "Raiffeisen Admin Development",
    ),
    name: "DEV CONFIG"
  );

  mainStart();

}