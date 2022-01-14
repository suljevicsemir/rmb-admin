// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqItem _$FaqItemFromJson(Map<String, dynamic> json) => FaqItem(
      id: json['id'] as String?,
      answerBj: json['answerBj'] as String,
      answerEn: json['answerEn'] as String,
      questionBj: json['questionBj'] as String,
      questionEn: json['questionEn'] as String,
    );

Map<String, dynamic> _$FaqItemToJson(FaqItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['questionBj'] = instance.questionBj;
  val['answerBj'] = instance.answerBj;
  val['questionEn'] = instance.questionEn;
  val['answerEn'] = instance.answerEn;
  return val;
}
