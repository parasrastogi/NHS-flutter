// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandModel _$BrandModelFromJson(Map<String, dynamic> json) {
  return BrandModel(
    name: json['Name'] as String?,
    builderLogo: json['BuilderLogo'] as String?,
    builderLogoSmall: json['BuilderLogoSmall'] as String?,
    builderId: json['BuilderId'] as int?,
    count: json['Count'] as int?,
    brandId: json['BrandId'] as int?,
  );
}

Map<String, dynamic> _$BrandModelToJson(BrandModel instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'BuilderLogo': instance.builderLogo,
      'BuilderLogoSmall': instance.builderLogoSmall,
      'BuilderId': instance.builderId,
      'Count': instance.count,
      'BrandId': instance.brandId,
    };
