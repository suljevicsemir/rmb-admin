

import 'package:flutter/cupertino.dart';
import 'package:rmb_admin/models/city.dart';
import 'package:rmb_admin/network_module/api_response.dart';
import 'package:rmb_admin/repositories/cities_repo.dart';

class CitiesProvider extends ChangeNotifier{
  final CitiesRepo _repo = CitiesRepo();

  CitiesProvider() {
    getCities();
  }

  List<City> _cities = [];
  City? _city;


  Future<void> createCity({required String city}) async{
    final APIResponse response = await _repo.createCity(city: City(name: city));
    if(response.responseType == ResponseTypes.ok) {
      await getCities();

    }
  }


  Future<void> getCities() async {
    _cities.clear();
    final APIResponse response = await _repo.getCities();
    if(response.responseType == ResponseTypes.ok) {
      _cities = response.data;
      _cities.forEach((element) {
        print("ID: " + element.id! + ", name: " + element.name);
      });
      notifyListeners();
    }
  }

  Future<void> editCity({required City city, required String name}) async {
    if(_city == null) {
      return;
    }
    _city!.name = name;
    final APIResponse response = await _repo.editCity(city: _city!);
    if(response.responseType == ResponseTypes.ok) {
      _cities[_cities.indexWhere((element) => element.id! == city.id!)] = city;
      notifyListeners();
    }
  }

  Future<String?> deleteCity({required City cityToDelete}) async {
    final APIResponse response = await _repo.deleteCity(city: cityToDelete);
    if(response.responseType == ResponseTypes.ok) {
      _cities.removeWhere((element) => element.id! == cityToDelete.id);
      notifyListeners();
    }
    return response.error;
  }

  void selectCity({required City city}) {
    _city = city;
    notifyListeners();
  }


  List<City> get cities => _cities;

  set cities(List<City> value) {
    _cities = value;
    notifyListeners();
  }

  bool isFieldEnabled({required String id}) {
    return _city != null && _city!.id == id;
  }

  City? get city => _city;
}