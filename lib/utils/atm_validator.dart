

import 'package:rmb_admin/models/locations_filter/branch/branch.dart';

class ATMValidator {

  bool _outside = true;
  bool _inside = false;

  bool _groupedValue = true;

  void setFromBranch(Branch branch) {
    if(branch.atmType.compareTo("UNUTRASNJI") == 0) {
      setInside();
      return;
    }
    setOutside();
  }

  void setOutside() {
    _outside = true;
    _groupedValue = true;
    _inside = false;
  }

  void setInside() {
    _inside = true;
    _groupedValue = true;
    _outside = false;
  }

  void reset() {
    _outside = true;
    _groupedValue = true;
    _inside = false;
  }

  bool get outside => _outside;

  bool get inside => _inside;

  bool get groupedValue => _groupedValue;
}