

import 'package:flutter/widgets.dart';
import 'package:rmb_admin/main/config/flavor_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    flavor: Flavor.prod,
    flavorValues: const FlavorValues(
      baseUrl: "",
      appName: "Raiffeisen Admin Site",
    ),
    name: "PROD CONFIG"
  );

}