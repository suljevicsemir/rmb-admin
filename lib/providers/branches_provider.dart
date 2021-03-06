import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/models/city.dart';
import 'package:rmb_admin/models/locations_filter/atm_filter.dart';
import 'package:rmb_admin/models/locations_filter/branch/branch.dart';
import 'package:rmb_admin/models/locations_filter/branch/branch_post.dart';
import 'package:rmb_admin/models/locations_filter/branch_service_type.dart';
import 'package:rmb_admin/models/locations_filter/branch_type.dart';
import 'package:rmb_admin/models/locations_filter/location.dart';
import 'package:rmb_admin/network_module/api_response.dart';
import 'package:rmb_admin/repositories/branches_repository.dart';
import 'package:rmb_admin/repositories/navigation_repo.dart';
import 'package:rmb_admin/utils/atm_validator.dart';

class BranchesProvider extends ChangeNotifier {

  final BranchesRepository _repo = BranchesRepository();
  List<Branch> _branches = [];

  BranchesProvider() {
    fetchBranches();
  }

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

  Future<void> fetchBranches() async {
    final APIResponse response = await _repo.getBranches();
    if(response.error == null) {
       branches = response.data;
    }
  }


  List<Branch> get branches => _branches;

  set branches(List<Branch> value) {
    _branches = value;
    notifyListeners();
  }

  String get citiesValue => _city == null ? "branches_page.validation.city".tr() : _city!.name;

  String get branchTypesValue => _branchType == null ? "branches_page.validation.branch_type".tr() : _branchType!.name;

  String get branchServiceTypes => _branchServiceType == null ? "branches_page.validation.branch_service_type".tr() : _branchServiceType!.name;

  String get atmFilters => _atmFilter == null ? "branches_page.validation.atm_filter".tr() : _atmFilter!.name;

  Future<void> create({required GlobalKey<FormState> formKey}) async{
    if(!formKey.currentState!.validate()) {
      return;
    }
    BranchPost branch = BranchPost(
      location: Location(
        address: addressController.text,
        latitude: double.parse(latitudeController.text),
        longitude: double.parse(longitudeController.text)
      ),
      name: nameController.text,
      cityId: _city!.id!,
      contact: contactController.text,
      workingHours: [],
      branchTypeId: _branchType!.id!,
      branchServiceTypeId: _branchServiceType!.id!,
      atmType: _atmValidator.inside ? "Unutra??nji" : "Vanjski",
      atmFilterId: _atmFilter!.id!,
    );

    final bool result = await _repo.createBranch(branch: branch);
    if(result) {
      locator.get<NavigationRepo>().showActionSuccessSnackBar('branches_page.validation.create_success'.tr());
      _clearInputs();
      notifyListeners();
    }
    else {
      locator.get<NavigationRepo>().showInvalidInputSnackBar('branches_page.validation.create_failure'.tr());
    }


  }

  Future<void> deleteBranch({required Branch branch}) async{
    final bool response = await _repo.deleteBranch(branch: branch);
    if(response) {
      print("uspjelo brisanje");
      _deleteBranch(branch: branch);
    }
    else {
      print("nije uspjelo brisanje");
    }
  }

  void _deleteBranch({required Branch branch}) {
    _branches.removeWhere((element) => element.id! == branch.id);
    notifyListeners();
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


  void _clearInputs() {
    addressController.clear();
    latitudeController.clear();
    longitudeController.clear();
    nameController.clear();
    contactController.clear();
    _atmValidator.reset();
    _city = null;
    _branchType = null;
    _branchServiceType = null;
    _atmFilter = null;
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

