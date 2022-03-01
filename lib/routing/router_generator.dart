import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/pages/export.dart';
import 'package:rmb_admin/providers/export.dart';

class AppRouter {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case SplashPage.route:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<SplashProvider>(
            create: (_) => SplashProvider(),
            lazy: false,
            child: const SplashPage(),
          ),
        );
      case LoginPage.route:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider<LoginProvider>(
              create: (_) => LoginProvider(),
              child: LoginPage(),
            )
        );
      case HomePage.route:
        return MaterialPageRoute(
            builder: (_) =>  const HomePage()
        );
      case FaqPage.route:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
              create: (_) => FaqProvider(),
              child: const FaqPage(),
              lazy: false,
            )
        );
      case FaqEditPage.route:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: settings.arguments as FaqProvider,
            child: const FaqEditPage(),
          ),
        );
      case CitiesPage.route:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider<CitiesProvider>(
              create: (_) => CitiesProvider(),
              lazy: false,
              child: const CitiesPage(),
            )
        );
      case FilterLocations.route:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider<LocationsFilterProvider>(
              create: (_) => LocationsFilterProvider(),
              lazy: false,
              child: const FilterLocations(),
            )
        );
      case BranchesInsertPage.route:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(
              providers: [
                ChangeNotifierProvider<CitiesProvider>(
                  create: (_) => CitiesProvider(),
                  lazy: false,
                ),
                ChangeNotifierProvider<LocationsFilterProvider>(
                  create: (_) => LocationsFilterProvider(),
                  lazy: false,
                ),
                ChangeNotifierProvider<BranchesProvider>(
                  create: (_) => BranchesProvider(),
                  lazy: false,
                ),
              ],
              child: const BranchesInsertPage(),
            )
        );
      case BranchesListPage.route:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider<BranchesProvider>(
              create: (_) => BranchesProvider(),
              lazy: false,
              child: const BranchesListPage(),
            )
        );
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: SafeArea(
                child: Center(
                  child: Text("Route not found"),
                ),
              ),
            )
        );
    }
  }
}