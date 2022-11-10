import 'package:json_annotation/json_annotation.dart';
import 'home_model.dart';

part 'home_list_result.g.dart';

@JsonSerializable()
class HomeListResult {
  HomeListResult({
    required this.homeModel,
    required this.totalCount,
    required this.error,
    required this.errorMessage,
    required this.code,
    this.uniqueKey,
  });

  @JsonKey(name: "Model")
  List<HomeModel>? homeModel;
  @JsonKey(name: "TotalCount")
  int totalCount;
  @JsonKey(name: "Error")
  bool error;
  @JsonKey(name: "ErrorMessage")
  String errorMessage;
  @JsonKey(name: "Code")
  int code;
  @JsonKey(name: "UniqueKey")
  dynamic uniqueKey;

  factory HomeListResult.fromJson(Map<String, dynamic> json) =>
      _$HomeListResultFromJson(json);

  Map<String, dynamic> toJson() => _$HomeListResultToJson(this);
}
