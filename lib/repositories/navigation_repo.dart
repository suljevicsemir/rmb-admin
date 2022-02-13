

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/pages/branches/branches_create_page.dart';
import 'package:rmb_admin/pages/cities/cities_page.dart';
import 'package:rmb_admin/pages/faq/pages/faq_edit_page.dart';
import 'package:rmb_admin/pages/faq/pages/faq_page.dart';
import 'package:rmb_admin/pages/filter_locations/filter_locations.dart';
import 'package:rmb_admin/pages/home/home.dart';
import 'package:rmb_admin/pages/login.dart';
import 'package:rmb_admin/providers/branches_provider.dart';
import 'package:rmb_admin/providers/cities_provider.dart';
import 'package:rmb_admin/providers/faq_provider.dart';
import 'package:rmb_admin/providers/locations_filter_provider.dart';
import 'package:rmb_admin/providers/login_provider.dart';
import 'package:rmb_admin/widgets/snackbars.dart';

class NavigationRepo{
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  late GoRouter _router;

  void setInitialRoute({required String initialRoute}) {
    _router = GoRouter(
      initialLocation: LoginPage.route,
      routes: [
        GoRoute(
          path: LoginPage.route,
          builder: (context, state) => ChangeNotifierProvider<LoginProvider>(
            create: (_) => LoginProvider(),
            child: const LoginPage(),
          ),
        ),
        GoRoute(
          name: HomePage.route,
          path: HomePage.route,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          name: FaqPage.route,
          path: FaqPage.route,
          builder: (context, state) {
            return ChangeNotifierProvider(
              create: (_) => FaqProvider(),
              child: const FaqPage(),
              lazy: false,
            );
          },
          routes: [
            GoRoute(
              path: ':id',
              name: FaqEditPage.route,
              builder: (context, state) => ChangeNotifierProvider.value(
                value: state.extra! as FaqProvider,
                child: const FaqEditPage(),
              ),
            ),
          ]
        ),
        GoRoute(
          name: CitiesPage.route,
          path: CitiesPage.route,
          builder: (context, state) => ChangeNotifierProvider<CitiesProvider>(
            create: (_) => CitiesProvider(),
            lazy: false,
            child: const CitiesPage(),
          )
        ),
        GoRoute(
          name: FilterLocations.route,
          path: FilterLocations.route,
          builder: (context, state) => ChangeNotifierProvider<LocationsFilterProvider>(
            create: (_) => LocationsFilterProvider(),
            lazy: false,
            child: const FilterLocations(),
          )
        ),
        GoRoute(
          name: BranchesInsertPage.route,
          path: BranchesInsertPage.route,
          builder: (context, state) => MultiProvider(
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
        )
      ],
    );
  }


  void pop({dynamic result}) {
    return _router.pop();
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments, Duration duration = const Duration(milliseconds: 50), Map<String, String> params = const {}}) async{
    await Future.delayed(duration);
    return _router.goNamed(routeName, params: params, extra: arguments);
  }




  Future<dynamic> navigateToNamed(String routeName, {Object? arguments, Duration duration = const Duration(milliseconds: 50)}) async {
    await Future.delayed(duration);
    return _router.pushNamed(routeName, queryParams: {
      'kurac' : '12cm'
    });
  }


  Future<dynamic> navigateAndRemove(String routeName, {dynamic arguments}) async{
    await Future.delayed(const Duration(milliseconds: 100));
    return _router.go(routeName);
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

  GoRouter get router => _router;


}