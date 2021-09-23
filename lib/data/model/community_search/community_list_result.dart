import 'package:json_annotation/json_annotation.dart';
import 'community_model.dart';

part 'community_list_result.g.dart';

@JsonSerializable()
class CommunityListResult {
  @JsonKey(name: "TotalCount")
  int? totalCount;
  @JsonKey(name: "TotalHomeCount")
  int? totalHomeCount;
  @JsonKey(name: 'Model')
  List<CommunityModel> resultsArray;
  String? errorMessage;
  bool? error;

  CommunityListResult(
      {this.totalCount,
      this.totalHomeCount,
      required this.resultsArray,
      this.errorMessage,
      this.error});

  factory CommunityListResult.fromJson(Map<String, dynamic> json) =>
      _$CommunityListResultFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityListResultToJson(this);
}
