
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/models/city.dart';
import 'package:rmb_admin/network_module/api_response.dart';
import 'package:rmb_admin/repositories/cities_repo.dart';
import 'package:rmb_admin/repositories/navigation_repo.dart';

class CitiesProvider extends ChangeNotifier{
  final CitiesRepo _repo = CitiesRepo();

  final TextEditingController _createController   = TextEditingController();
  final TextEditingController _editingController  = TextEditingController();
  final TextEditingController _queryController    = TextEditingController();

  CitiesProvider() {
    getCities();
  }

  List<City> _cities = [];
  List<City> _filteredCities = [];
  City? _city;


  Future<void> createCity() async{
    final APIResponse response = await _repo.createCity(city: City(name: _createController.text));
    if(response.responseType == ResponseTypes.ok) {
      _createController.clear();
      _editingController.clear();
      _queryController.clear();
      notifyListeners();
      await getCities();
    }
  }


  Future<void> getCities() async {
    _cities.clear();
    final APIResponse response = await _repo.getCities();
    if(response.responseType == ResponseTypes.ok) {
      _cities = response.data;
      _filteredCities = response.data;
      notifyListeners();
    }
  }

  Future<void> editCity() async {
    if(_city == null || _editingController.text.isEmpty) {
      locator.get<NavigationRepo>().showInvalidInputSnackBar('cities_page.must_select'.tr());
      return;
    }
    _city!.name = _editingController.text;
    final APIResponse response = await _repo.editCity(city: _city!);
    if(response.responseType == ResponseTypes.ok) {
      _cities[_cities.indexWhere((element) => element.id! == _city!.id!)] = _city!;
      notifyListeners();
    }
  }

  Future<String?> deleteCity() async {
    if(_city == null) {
      locator.get<NavigationRepo>().showInvalidInputSnackBar('cities_page.must_select'.tr());
      return null;
    }
    final APIResponse response = await _repo.deleteCity(city: _city!);
    if(response.responseType == ResponseTypes.ok) {
      _cities.removeWhere((element) => element.id! == _city!.id!);
      _filteredCities.removeWhere((element) => element.id! == _city!.id!);
      _editingController.clear();
      notifyListeners();
    }
    return response.error;
  }

  void selectCity({required City city}) {
    _city = city;
    _editingController.text = city.name;
    notifyListeners();
  }

  void queryCities() {
    if(_queryController.text.isEmpty) {
      _filteredCities = _cities;
      notifyListeners();
      return;
    }
    final String query = _queryController.text.trim().toUpperCase();
    _filteredCities = _cities.where((element) => element.name.toUpperCase().startsWith(query)).toList();
    notifyListeners();
  }


  List<City> get cities => _cities;

  set cities(List<City> value) {
    _cities = value;
    notifyListeners();
  }


  List<City> get filteredCities => _filteredCities;

  set filteredCities(List<City> value) {
    _filteredCities = value;
    notifyListeners();
  }

  bool isFieldEnabled({required String id}) {
    return _city != null && _city!.id == id;
  }

  City? get city => _city;


  TextEditingController get createController => _createController;
  TextEditingController get editingController => _editingController;
  TextEditingController get queryController => _queryController;

  @override
  void dispose() {
    _createController.dispose();
    _editingController.dispose();
    super.dispose();
  }


}