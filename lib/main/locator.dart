
import 'package:get_it/get_it.dart';
import 'package:rmb_admin/repositories/auth_repo.dart';
import 'package:rmb_admin/repositories/navigation_repo.dart';
import 'package:rmb_admin/repositories/secure_storage_repo.dart';
import 'package:rmb_admin/utils/password_validator.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationRepo());
  locator.registerLazySingleton(() => SecureStorageRepo());
  locator.registerLazySingleton(() => CredentialsValidator());
  locator.registerSingleton<AuthRepo>(AuthRepo());

}