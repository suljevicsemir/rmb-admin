

import 'package:flutter/cupertino.dart';
import 'package:rmb_admin/models/faq_item.dart';
import 'package:rmb_admin/network_module/api_response.dart';
import 'package:rmb_admin/repositories/faq_repository.dart';

class FaqProvider extends ChangeNotifier {

  final FaqRepo _repo = FaqRepo();
  final String _selectedItem = "";

  List<FaqItem> _faqItems = [];

  FaqProvider() {
    loadFaq();
  }

  Future<void> loadFaq() async {
    APIResponse<List<FaqItem>> list = await _repo.getFaq();
    if(list.responseType == ResponseTypes.ok) {
      faqItems = list.data!;
    }
  }

  Future<void> deleteFaqItem() async {
    if(_selectedItem.isEmpty) {

      return;
    }



  }





  List<FaqItem> get faqItems => _faqItems;

  set faqItems(List<FaqItem> value) {
    _faqItems = value;
    notifyListeners();
  }
}