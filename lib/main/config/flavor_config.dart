

enum Flavor {
  dev,
  prod
}

class FlavorValues {
  const FlavorValues({required this.appName, required this.baseUrl});

  final String baseUrl;
  final String appName;
}

class FlavorConfig {

  final Flavor flavor;
  final String name;
  final FlavorValues flavorValues;
  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required FlavorValues flavorValues,
    required String name
}) {
    _instance ??= FlavorConfig._internal(flavor: flavor, flavorValues: flavorValues, name: name);
    return _instance!;
  }

  FlavorConfig._internal({required this.flavor, required this.flavorValues, required this.name});


  static FlavorConfig get instance {
    return _instance!;
  }
  static bool isProduction() => _instance!.flavor == Flavor.prod;
  static bool isDevelopment() => _instance!.flavor == Flavor.dev;
}