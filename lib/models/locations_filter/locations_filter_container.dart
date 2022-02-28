
import 'package:rmb_admin/models/locations_filter/atm_filter.dart';
import 'package:rmb_admin/models/locations_filter/branch_service_type.dart';
import 'package:rmb_admin/models/locations_filter/branch_type.dart';


class LocationsFilterContainer {

  const LocationsFilterContainer({
    required this.branchServiceTypes,
    required this.branchTypes,
    required this.atmFilters
  });

  final List<BranchType>? branchTypes;
  final List<BranchServiceType>? branchServiceTypes;
  final List<ATMFilter>? atmFilters;

}