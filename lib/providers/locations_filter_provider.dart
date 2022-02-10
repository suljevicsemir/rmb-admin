
import 'package:flutter/cupertino.dart';
import 'package:rmb_admin/models/locations_filter/atm_filter.dart';
import 'package:rmb_admin/models/locations_filter/branch_service_type.dart';
import 'package:rmb_admin/models/locations_filter/branch_type.dart';
import 'package:rmb_admin/models/locations_filter/location_filter.dart';
import 'package:rmb_admin/models/locations_filter/locations_filter_container.dart';
import 'package:rmb_admin/network_module/api_response.dart';
import 'package:rmb_admin/repositories/locations_filter_repo.dart';

class LocationsFilterProvider extends ChangeNotifier {

  LocationsFilterProvider() {
    fetchFilters();
  }

  final LocationsFilterRepo _repo = LocationsFilterRepo();

  List<BranchServiceType>? _branchServiceTypes;
  List<BranchType>? _branchTypes;
  List<ATMFilter>? _atmServices;
  bool _filtersLoading = false;

  final TextEditingController _branchTypeControllerBj = TextEditingController();
  final TextEditingController _branchServiceTypeControllerBj = TextEditingController();
  final TextEditingController _atmTypeControllerBj = TextEditingController();

  final TextEditingController _branchTypeControllerEn = TextEditingController();
  final TextEditingController _branchServiceTypeControllerEn = TextEditingController();
  final TextEditingController _atmTypeControllerEn = TextEditingController();


  Future<void> fetchFilters() async {
    filtersLoading = true;
    final LocationsFilterContainer filter = await _repo.getFilters();
    filtersLoading = false;
    if(filter.branchTypes != null) {
      _branchTypes = filter.branchTypes!;
    }
    if(filter.branchServiceTypes != null) {
      _branchServiceTypes = filter.branchServiceTypes!;
    }
    notifyListeners();
  }

  void selectBranchType() {

  }

  void selectFilter({required LocationFilter filter}) {

  }

  Future<void> createBranchType() async{
    final BranchType branchType = BranchType(name: _branchTypeControllerBj.text);
    final APIResponse response = await _repo.createBranchType(branchType: branchType);
    await fetchFilters();
  }

  Future<void> createBranchServiceType() async{
    final BranchServiceType branchServiceType = BranchServiceType(name: _branchServiceTypeControllerBj.text);
    final APIResponse response = await _repo.createBranchServiceType(branchServiceType: branchServiceType);
    await fetchFilters();
  }

  void createAtmType() {

  }


  Future<void> deleteBranchType({required BranchType branchType}) async {
    final APIResponse response = await _repo.deleteBranchType(id: branchType.id!);
    if(response.error != null) {
      return;
    }
    _branchTypes!.removeWhere((element) => element.id! == branchType.id!);
    notifyListeners();
  }

  Future<void> deleteBranchServiceType({required BranchServiceType branchServiceType}) async {
    final APIResponse response = await _repo.deleteBranchServiceType(id: branchServiceType.id!);
    if(response.error != null) {
      return;
    }
    _branchServiceTypes!.removeWhere((element) => element.id! == branchServiceType.id!);
    notifyListeners();
  }

  Future<void> deleteATMService() async {
    // final APIResponse response = await _repo.deleteATMService(id: branchServiceType.id!);
    // if(response.error != null) {
    //   return;
    // }
    // _branchServiceTypes!.removeWhere((element) => element.id! == branchServiceType.id!);
    // notifyListeners();
  }

  List<BranchType>? get branchTypes => _branchTypes;

  List<BranchServiceType>? get branchServiceTypes => _branchServiceTypes;

  List<ATMFilter>? get atmServices => _atmServices;

  bool get filtersLoading => _filtersLoading;

  set filtersLoading(bool value) {
    _filtersLoading = value;
    notifyListeners();
  }

  TextEditingController get atmTypeControllerBj => _atmTypeControllerBj;

  TextEditingController get branchServiceTypeControllerBj => _branchServiceTypeControllerBj;

  TextEditingController get branchTypeControllerBj => _branchTypeControllerBj;


  TextEditingController get branchTypeControllerEn => _branchTypeControllerEn;

  TextEditingController get branchServiceTypeControllerEn => _branchServiceTypeControllerEn;

  TextEditingController get atmTypeControllerEn => _atmTypeControllerEn;

  @override
  void dispose() {
    super.dispose();
    _atmTypeControllerBj.dispose();
    _branchServiceTypeControllerBj.dispose();
    _branchTypeControllerBj.dispose();

    _atmTypeControllerEn.dispose();
    _branchServiceTypeControllerEn.dispose();
    _branchTypeControllerEn.dispose();
  }


}