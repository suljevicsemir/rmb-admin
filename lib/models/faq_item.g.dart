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

Map<String, dynamic> _$FaqItemToJson(FaqItem instance) => <String, dynamic>{
      'id': instance.id,
      'questionBj': instance.questionBj,
      'answerBj': instance.answerBj,
      'questionEn': instance.questionEn,
      'answerEn': instance.answerEn,
    };
