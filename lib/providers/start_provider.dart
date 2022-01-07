

import 'package:flutter/cupertino.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/repositories/navigation_repo.dart';
import 'package:rmb_admin/repositories/secure_storage_repo.dart';

class StartProvider extends ChangeNotifier {


  Future<void> websiteStart() async {
    final bool logged = await locator.get<SecureStorageRepo>().isLoggedIn();
    if(logged) {

    }
  }


}