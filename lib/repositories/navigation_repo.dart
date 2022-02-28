import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/pages/branches/branches_create_page.dart';
import 'package:rmb_admin/pages/branches/branches_list_page.dart';
import 'package:rmb_admin/pages/cities/cities_page.dart';
import 'package:rmb_admin/pages/faq/pages/faq_edit_page.dart';
import 'package:rmb_admin/pages/faq/pages/faq_page.dart';
import 'package:rmb_admin/pages/filter_locations/filter_locations.dart';
import 'package:rmb_admin/pages/home/home.dart';
import 'package:rmb_admin/pages/login.dart';
import 'package:rmb_admin/pages/splash_page.dart';
import 'package:rmb_admin/providers/branches_provider.dart';
import 'package:rmb_admin/providers/cities_provider.dart';
import 'package:rmb_admin/providers/faq_provider.dart';
import 'package:rmb_admin/providers/locations_filter_provider.dart';
import 'package:rmb_admin/providers/login_provider.dart';
import 'package:rmb_admin/providers/splash_provider.dart';
import 'package:rmb_admin/widgets/snackbars.dart';

class NavigationRepo{
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  dynamic pop({dynamic result}) {
    return _navigationKey.currentState!.pop(result);
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments, Duration duration = const Duration(milliseconds: 50)}) async{
    await Future.delayed(duration);
    return _navigationKey.currentState!.pushNamed(routeName, arguments: arguments);
  }


  Future<dynamic> navigateAndRemove(String routeName, {dynamic arguments, Duration duration = const Duration(milliseconds: 50)}) async{
    await Future.delayed(duration);
    return _navigationKey.currentState!.pushNamedAndRemoveUntil(routeName, (_) => false, arguments: arguments);
  }

  Future<dynamic> popCurrentAndPush(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!.popAndPushNamed(routeName, arguments: arguments);
  }
  Future<void> popUntilNamed(String routeName) async{
    _navigationKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }

  Future<void> popMultipleRoutes(int count) async {
    int value = 0;
    _navigationKey.currentState!.popUntil((route) => value++ >= count);
  }

  Future<void> showInvalidInputSnackBar(String label) async {
    _scaffoldKey.currentState!.clearSnackBars();
    _scaffoldKey.currentState!.showSnackBar(InvalidInputSnackBar(label: label));
  }
  Future<dynamic> showActionSuccessSnackBar(String label) async {
    _scaffoldKey.currentState!.showSnackBar(ActionSuccessSnackBar(label: label));
  }

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  GlobalKey<ScaffoldMessengerState> get scaffoldKey => _scaffoldKey;

}


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