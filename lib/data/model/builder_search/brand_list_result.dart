import 'package:json_annotation/json_annotation.dart';
import 'brand_model.dart';

part 'brand_list_result.g.dart';

@JsonSerializable()
class BrandListResult {
  BrandListResult({
    required this.brandModel,
    this.entity,
    required this.error,
    required this.errorMessage,
    required this.code,
    this.uniqueKey,
  });

  @JsonKey(name: "Model")
  List<BrandModel> brandModel;

  @JsonKey(name: "Entity")
  dynamic entity;

  @JsonKey(name: "Error")
  bool error;

  @JsonKey(name: "ErrorMessage")
  String errorMessage;

  @JsonKey(name: "Code")
  int code;

  @JsonKey(name: "UniqueKey")
  dynamic uniqueKey;

  factory BrandListResult.fromJson(Map<String, dynamic> json) =>
      _$BrandListResultFromJson(json);

  Map<String, dynamic> toJson() => _$BrandListResultToJson(this);
}
