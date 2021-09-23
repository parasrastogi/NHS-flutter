import 'package:json_annotation/json_annotation.dart';

part 'brand_model.g.dart';

@JsonSerializable()
class BrandModel {
  BrandModel({
    this.name,
    this.builderLogo,
    this.builderLogoSmall,
    this.builderId,
    this.count,
    this.brandId,
  });

  @JsonKey(name: 'Name')
  String? name;

  @JsonKey(name: 'BuilderLogo')
  String? builderLogo;

  @JsonKey(name: 'BuilderLogoSmall')
  String? builderLogoSmall;

  @JsonKey(name: 'BuilderId')
  int? builderId;

  @JsonKey(name: 'Count')
  int? count;

  @JsonKey(name: 'BrandId')
  int? brandId;

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandModelToJson(this);
}
