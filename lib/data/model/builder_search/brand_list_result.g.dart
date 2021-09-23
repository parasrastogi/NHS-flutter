// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_list_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandListResult _$BrandListResultFromJson(Map<String, dynamic> json) {
  return BrandListResult(
    brandModel: (json['Model'] as List<dynamic>)
        .map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    entity: json['Entity'],
    error: json['Error'] as bool,
    errorMessage: json['ErrorMessage'] as String,
    code: json['Code'] as int,
    uniqueKey: json['UniqueKey'],
  );
}

Map<String, dynamic> _$BrandListResultToJson(BrandListResult instance) =>
    <String, dynamic>{
      'Model': instance.brandModel,
      'Entity': instance.entity,
      'Error': instance.error,
      'ErrorMessage': instance.errorMessage,
      'Code': instance.code,
      'UniqueKey': instance.uniqueKey,
    };
