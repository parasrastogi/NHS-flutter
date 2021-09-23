// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_ahead_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeAheadModel _$TypeAheadModelFromJson(Map<String, dynamic> json) {
  return TypeAheadModel(
    Id: json['Id'] as int,
    Type: json['Type'] as String,
    Name: json['Name'] as String,
    MarketId: json['MarketId'] as int,
    MarketName: json['MarketName'] as String,
    MarketStateAbbr: json['MarketStateAbbr'] as String,
    MarketStateName: json['MarketStateName'] as String,
    Latitude: (json['Latitude'] as num).toDouble(),
    Longitude: (json['Longitude'] as num).toDouble(),
    City: json['City'] as String,
    State: json['State'] as String,
  );
}

Map<String, dynamic> _$TypeAheadModelToJson(TypeAheadModel instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'Name': instance.Name,
      'Type': instance.Type,
      'MarketId': instance.MarketId,
      'MarketName': instance.MarketName,
      'MarketStateAbbr': instance.MarketStateAbbr,
      'MarketStateName': instance.MarketStateName,
      'Latitude': instance.Latitude,
      'Longitude': instance.Longitude,
      'City': instance.City,
      'State': instance.State,
    };
