
import 'package:rmb_admin/models/locations_filter/branch_service_type.dart';
import 'package:rmb_admin/models/locations_filter/branch_type.dart';


class LocationsFilterContainer {

  const LocationsFilterContainer({
    required this.branchServiceTypes,
    required this.branchTypes
  });

  final List<BranchType>? branchTypes;
  final List<BranchServiceType>? branchServiceTypes;

}

abstract class Filter {

}