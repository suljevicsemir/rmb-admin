import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:rmb_admin/models/city.dart';
import 'package:rmb_admin/models/locations_filter/atm_filter.dart';
import 'package:rmb_admin/models/locations_filter/branch/branch_post.dart';
import 'package:rmb_admin/models/locations_filter/branch_service_type.dart';
import 'package:rmb_admin/models/locations_filter/branch_type.dart';
import 'package:rmb_admin/models/locations_filter/location.dart';
import 'package:rmb_admin/repositories/branches_repository.dart';
import 'package:rmb_admin/utils/atm_validator.dart';

class BranchesProvider extends ChangeNotifier {

  final BranchesRepository _repo = BranchesRepository();

  final TextEditingController addressController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  final ATMValidator _atmValidator = ATMValidator();

  City? _city;
  BranchType? _branchType;
  BranchServiceType? _branchServiceType;
  ATMFilter? _atmFilter;


  String get citiesValue => _city == null ? "branches_page.validation.city".tr() : _city!.name;

  String get branchTypesValue => _branchType == null ? "branches_page.validation.branch_type".tr() : _branchType!.name;

  String get branchServiceTypes => _branchServiceType == null ? "branches_page.validation.branch_service_type".tr() : _branchServiceType!.name;

  String get atmFilters => _atmFilter == null ? "branches_page.validation.atm_filter".tr() : _atmFilter!.name;

  Future<void> create() async{
    debugPrint("Testig output");
    debugPrint("Adresa: ${addressController.text}");
    debugPrint("Latitude: ${latitudeController.text}");
    debugPrint("Longitude: ${longitudeController.text}");

    debugPrint("Branch name" + nameController.text);
    debugPrint("City: " + _city!.name);
    debugPrint("Contact: " + contactController.text);
    debugPrint("Branch type: " + branchType!.name);
    debugPrint("Branch service type: " + branchServiceType!.name);
    debugPrint("ATM type: " + atmFilter!.name);

    BranchPost branch = BranchPost(
      location: Location(
        address: addressController.text,
        latitude: 42.14,
        longitude: 38.12
      ),
      name: "Test1",
      cityId: _city!.id!,
      contact: contactController.text,
      workingHours: [],
      branchTypeId: _branchType!.id!,
      branchServiceTypeId: _branchServiceType!.id!,
      atmType: "s",
      atmFilterId: _atmFilter!.id!,
    );

    _repo.createBranch(branch: branch);

  }

  void setATMOutside() {
    _atmValidator.setOutside();
    notifyListeners();
  }

  void setATMInside() {
    _atmValidator.setInside();
    notifyListeners();
  }


  ATMValidator get atmValidator => _atmValidator;


  City? get city => _city;

  set city(City? value) {
    _city = value;
    notifyListeners();
  }

  BranchType? get branchType => _branchType;

  set branchType(BranchType? value) {
    _branchType = value;
    notifyListeners();
  }


  BranchServiceType? get branchServiceType => _branchServiceType;

  set branchServiceType(BranchServiceType? value) {
    _branchServiceType = value;
    notifyListeners();
  }

  ATMFilter? get atmFilter => _atmFilter;

  set atmFilter(ATMFilter? value) {
    _atmFilter = value;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    addressController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
    nameController.dispose();
    contactController.dispose();
  }

}

