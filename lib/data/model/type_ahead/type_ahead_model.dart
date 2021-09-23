import 'package:json_annotation/json_annotation.dart';

part 'type_ahead_model.g.dart';

@JsonSerializable()
class TypeAheadModel {
  final int Id;
  final String Name;
  final String Type;
  final int MarketId;
  final String MarketName;
  final String MarketStateAbbr;
  final String MarketStateName;
  final double Latitude;
  final double Longitude;
  final String City;
  final String State;

  const TypeAheadModel({
    required this.Id,
    required this.Type,
    required this.Name,
    required this.MarketId,
    required this.MarketName,
    required this.MarketStateAbbr,
    required this.MarketStateName,
    required this.Latitude,
    required this.Longitude,
    required this.City,
    required this.State,
  });

  factory TypeAheadModel.fromJson(Map<String, dynamic> json) {
    return _$TypeAheadModelFromJson(json);
    // return TypeAheadModel(
    //     Id: json['Id'] as int,
    //     Type: json['Type'] as String,
    //     Name: json['Name'] as String,
    //     MarketId: json['MarketId'] as int,
    //     MarketName: json['MarketName'] as String,
    //     MarketStateAbbr: json['MarketStateAbbr'] as String,
    //     MarketStateName: json['MarketStateName'] as String,
    //     Latitude: json['Latitude'] as double,
    //     Longitude: json['Longitude'] as double,
    //     City: json['City'] as String,
    //     State: json['State'] as String);
  }

  Map<String, dynamic> toJson() => _$TypeAheadModelToJson(this);
}
