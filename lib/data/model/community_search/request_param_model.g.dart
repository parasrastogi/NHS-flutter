// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_param_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestParamModel _$RequestParamModelFromJson(Map<String, dynamic> json) {
  return RequestParamModel(
    brandId: json['brandId'] as int?,
    builderId: json['builderId'] as int?,
    communityIds:
        (json['communityIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
    marketId: json['marketId'] as int?,
    paging: json['paging'] == null
        ? null
        : Paging.fromJson(json['paging'] as Map<String, dynamic>),
    partnerId: json['partnerId'] as int?,
    originLat: (json['originLat'] as num?)?.toDouble(),
    originLng: (json['originLng'] as num?)?.toDouble(),
    radius: json['radius'] as int?,
    brands: (json['brands'] as List<dynamic>?)?.map((e) => e as int).toList(),
    SchoolDistricts: (json['SchoolDistricts'] as List<dynamic>?)
        ?.map((e) => e as int)
        .toList(),
    Amenities:
        (json['Amenities'] as List<dynamic>?)?.map((e) => e as String).toList(),
    Bed: json['Bed'] as int?,
    Bath: json['Bath'] as int?,
    SpecialOffers: json['SpecialOffers'] as bool?,
    HomeType: json['HomeType'] as String?,
    CommStatus: json['CommStatus'] as String?,
    BuilderType: json['BuilderType'] as String?,
    PriceLow: json['PriceLow'] as int?,
    PriceHigh: json['PriceHigh'] as int?,
    SqftLow: json['SqftLow'] as int?,
    SqftHigh: json['SqftHigh'] as int?,
    homeStatus: json['homeStatus'] as String?,
    masterBedroom: json['masterBedroom'] as int?,
    garage: json['garage'] as int?,
    stories: json['stories'] as int?,
    livingArea: json['livingArea'] as int?,
    searchType: json['searchType'] as String?,
    city: json['city'] as String?,
    state: json['state'] as String?,
    zipCode: json['zipCode'] as String?,
    includeMPC: json['includeMPC'] as bool,
  );
}

Map<String, dynamic> _$RequestParamModelToJson(RequestParamModel instance) =>
    <String, dynamic>{
      'brandId': instance.brandId,
      'builderId': instance.builderId,
      'communityIds': instance.communityIds,
      'marketId': instance.marketId,
      'paging': instance.paging,
      'partnerId': instance.partnerId,
      'originLat': instance.originLat,
      'originLng': instance.originLng,
      'radius': instance.radius,
      'brands': instance.brands,
      'SchoolDistricts': instance.SchoolDistricts,
      'Amenities': instance.Amenities,
      'Bed': instance.Bed,
      'Bath': instance.Bath,
      'SpecialOffers': instance.SpecialOffers,
      'HomeType': instance.HomeType,
      'CommStatus': instance.CommStatus,
      'BuilderType': instance.BuilderType,
      'PriceLow': instance.PriceLow,
      'PriceHigh': instance.PriceHigh,
      'SqftLow': instance.SqftLow,
      'SqftHigh': instance.SqftHigh,
      'homeStatus': instance.homeStatus,
      'masterBedroom': instance.masterBedroom,
      'garage': instance.garage,
      'stories': instance.stories,
      'livingArea': instance.livingArea,
      'searchType': instance.searchType,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'includeMPC': instance.includeMPC,
    };
