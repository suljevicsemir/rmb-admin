

import 'package:flutter/cupertino.dart';
import 'package:rmb_admin/models/faq_item.dart';
import 'package:rmb_admin/network_module/api_response.dart';
import 'package:rmb_admin/repositories/faq_repository.dart';

class FaqProvider extends ChangeNotifier {

  final FaqRepo _repo = FaqRepo();
  final String _selectedItem = "";

  FaqProvider() {
    loadFaq();
  }

  TextEditingController _questionBj = TextEditingController();
  TextEditingController _questionEn = TextEditingController();
  TextEditingController _answerBj = TextEditingController();
  TextEditingController _answerEn = TextEditingController();

  List<FaqItem> _faqItems = [];
  FaqItem? _faqItem;

  void onFaqEdit({required FaqItem faqItem}) {
    //initializing text fields, this way they're not initialized before they're needed
    _questionBj = TextEditingController(text: faqItem.questionBj);
    _questionEn = TextEditingController(text: faqItem.questionEn);
    _answerBj = TextEditingController(text: faqItem.answerBj);
    _answerEn = TextEditingController(text: faqItem.answerEn);
    _faqItem = faqItem;
    notifyListeners();
  }

  void onFaqCreate() {
    _questionBj.clear();
    _questionEn.clear();
    _answerBj.clear();
    _answerEn.clear();
    notifyListeners();
  }

  Future<void> loadFaq() async {
    if(_faqItems.isNotEmpty) {
      return;
    }
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




  @override
  void dispose() {
    super.dispose();
    print("DISPOSING JEBENI FAQ PROVIDER");
    _questionEn.dispose();
    _questionBj.dispose();
    _answerEn.dispose();
    _answerBj.dispose();

  }

  TextEditingController get questionBj => _questionBj;

  TextEditingController get questionEn => _questionEn;

  TextEditingController get answerBj => _answerBj;

  TextEditingController get answerEn => _answerEn;
}