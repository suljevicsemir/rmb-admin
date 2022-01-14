
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/models/faq_item.dart';
import 'package:rmb_admin/network_module/api_response.dart';
import 'package:rmb_admin/repositories/faq_repository.dart';
import 'package:rmb_admin/repositories/navigation_repo.dart';

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

  void selectFaq({required FaqItem faqItem}) {
    //initializing text fields, this way they're not initialized before they're needed
    _questionBj = TextEditingController(text: faqItem.questionBj);
    _questionEn = TextEditingController(text: faqItem.questionEn);
    _answerBj = TextEditingController(text: faqItem.answerBj);
    _answerEn = TextEditingController(text: faqItem.answerEn);
    _faqItem = faqItem;
    notifyListeners();
  }

  void onFaqCreate() {
    _faqItem = null;
    _questionBj.clear();
    _questionEn.clear();
    _answerBj.clear();
    _answerEn.clear();
    notifyListeners();
  }

  Future<void> saveChanges() async {
    if(_faqItem == null) {
      print("FAQ JE NULL");
      await _createFaq();
      return;
    }
    await _editFaq();
  }

  Future<void> _createFaq() async {
    print('creating faq');
    _faqItem = FaqItem(
      answerBj: _answerBj.text,
      answerEn: _answerEn.text,
      questionBj: _questionBj.text,
      questionEn: _questionEn.text
    );
    final APIResponse<FaqItem?> response = await _repo.createFaqItem(faqItem: _faqItem!);
    if(response.responseType == ResponseTypes.ok) {
      _faqItems.insert(0, response.data!);
    }
  }

  Future<void> _editFaq() async {
    _faqItem = FaqItem(
      id: _faqItem!.id!,
      answerBj: _answerBj.text,
      answerEn: _answerEn.text,
      questionBj: _questionBj.text,
      questionEn: _questionEn.text
    );
    final APIResponse apiResponse = await _repo.editFaqItem(faqItem: _faqItem!);
    if(apiResponse.error == null) {
      _faqItems[_faqItems.indexWhere((element) => element.id! == _faqItem!.id!)] = _faqItem!;
      notifyListeners();
      locator.get<NavigationRepo>().showActionSuccessSnackBar('faq_edit_page.question_updated'.tr());
    }
    else {
      locator.get<NavigationRepo>().showInvalidInputSnackBar('faq_edit_page.failed_update'.tr());
    }
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

  Future<String?> deleteFaqItem() async {
    if(_faqItem == null) {
      return 'faq_page.item_not_selected'.tr();
    }
    APIResponse response = await _repo.deleteFaqItem(faqItem: _faqItem!);
    if(response.responseType == ResponseTypes.ok) {
      _faqItems.removeWhere((element) => element.id! == _faqItem!.id!);
      notifyListeners();
      return null;
    }
    return response.error;
  }


  List<FaqItem> get faqItems => _faqItems;

  set faqItems(List<FaqItem> value) {
    _faqItems = value;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
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