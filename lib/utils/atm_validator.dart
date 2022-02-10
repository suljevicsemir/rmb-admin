

class ATMValidator {

  bool _outside = true;
  bool _inside = false;

  bool _groupedValue = true;

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

  bool get outside => _outside;

  bool get inside => _inside;

  bool get groupedValue => _groupedValue;
}