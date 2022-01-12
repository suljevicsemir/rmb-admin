
import 'package:get_it/get_it.dart';
import 'package:rmb_admin/repositories/navigation_repo.dart';
import 'package:rmb_admin/repositories/secure_storage_repo.dart';
import 'package:url_strategy/url_strategy.dart';
final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationRepo());
  locator.registerLazySingleton(() => SecureStorageRepo());
  setPathUrlStrategy();
}