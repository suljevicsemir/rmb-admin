

import 'package:json_annotation/json_annotation.dart';

part 'faq_item.g.dart';

@JsonSerializable()
class FaqItem {

  const FaqItem({
    this.id,
    required this.answerBj,
    required this.answerEn,
    required this.questionBj,
    required this.questionEn
  });

  factory FaqItem.fromJson(Map<String, dynamic> json) => _$FaqItemFromJson(json);

  Map<String, dynamic> toJson() => _$FaqItemToJson(this);

  final String? id;
  final String questionBj;
  final String answerBj;
  final String questionEn;
  final String answerEn;
}