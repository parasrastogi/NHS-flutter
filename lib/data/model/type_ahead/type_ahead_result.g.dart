// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_ahead_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeAheadResult _$TypeAheadResultFromJson(Map<String, dynamic> json) {
  return TypeAheadResult(
    typeAheadList: (json['Model'] as List<dynamic>)
        .map((e) => TypeAheadModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TypeAheadResultToJson(TypeAheadResult instance) =>
    <String, dynamic>{
      'Model': instance.typeAheadList,
    };
