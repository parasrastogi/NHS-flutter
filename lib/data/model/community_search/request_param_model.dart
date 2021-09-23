import 'dart:core';
import 'package:json_annotation/json_annotation.dart';
import 'package:newhomesource/data/model/community_search/paging.dart';

part 'request_param_model.g.dart';

@JsonSerializable()
class RequestParamModel {
  //var totalFiltersAppliedCount = 0;
  int? brandId;
  int? builderId;
  List<int>? communityIds;
  int? marketId;
  Paging? paging;
  int? partnerId;
  double? originLat;
  double? originLng;
  int? radius;
  List<int>? brands;
  List<int>? SchoolDistricts;
  List<String>? Amenities;
  int? Bed;
  int? Bath;
  bool? SpecialOffers;
  String? HomeType;
  String? CommStatus;
  String? BuilderType;
  int? PriceLow;
  int? PriceHigh;
  int? SqftLow;
  int? SqftHigh;
  String? homeStatus;
  int? masterBedroom;
  int? garage;
  int? stories;
  int? livingArea;
  String? searchType;
  String? city;
  String? state;
  String? zipCode;
  bool includeMPC;

  RequestParamModel(
      {this.brandId,
      this.builderId,
      this.communityIds,
      this.marketId,
      this.paging,
      this.partnerId,
      this.originLat,
      this.originLng,
      this.radius,
      this.brands,
      this.SchoolDistricts,
      this.Amenities,
      this.Bed,
      this.Bath,
      this.SpecialOffers,
      this.HomeType,
      this.CommStatus,
      this.BuilderType,
      this.PriceLow,
      this.PriceHigh,
      this.SqftLow,
      this.SqftHigh,
      this.homeStatus,
      this.masterBedroom,
      this.garage,
      this.stories,
      this.livingArea,
      this.searchType,
      this.city,
      this.state,
      this.zipCode,
      required this.includeMPC});

  factory RequestParamModel.fromJson(Map<String, dynamic> json) =>
      _$RequestParamModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestParamModelToJson(this);
}
