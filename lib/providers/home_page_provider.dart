

import 'package:flutter/cupertino.dart';

class HomePageProvider extends ChangeNotifier {

  bool _sidebarCollapsed = false;





  bool get sidebarCollapsed => _sidebarCollapsed;

  void onSidebarTap() {
    _sidebarCollapsed = !_sidebarCollapsed;
    notifyListeners();
  }

}