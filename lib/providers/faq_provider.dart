

import 'package:flutter/cupertino.dart';
import 'package:rmb_admin/models/faq_item.dart';
import 'package:rmb_admin/repositories/faq_repository.dart';

class FaqProvider extends ChangeNotifier {

  final FaqRepo _repo = FaqRepo();

  List<FaqItem> _faqItems = [];

  FaqProvider() {
    _repo.getFaq();
  }

  Future<void> loadFaq() async {

  }





  List<FaqItem> get faqItems => _faqItems;

  set faqItems(List<FaqItem> value) {
    _faqItems = value;
    notifyListeners();
  }
}