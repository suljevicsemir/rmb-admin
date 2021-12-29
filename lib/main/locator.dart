
import 'package:get_it/get_it.dart';
import 'package:rmb_admin/repositories/navigation_repo.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationRepo());
}