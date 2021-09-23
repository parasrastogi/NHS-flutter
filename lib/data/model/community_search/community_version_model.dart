import 'package:json_annotation/json_annotation.dart';

part 'community_version_model.g.dart';

@JsonSerializable()
class CommunityVersionModel {
  int communityID = 0;
  int dBVersion;
  int bDXCommunityID;

  CommunityVersionModel(
      {required this.communityID,
      required this.dBVersion,
      required this.bDXCommunityID});

  factory CommunityVersionModel.fromJson(Map<String, dynamic> json) =>
      _$CommunityVersionModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommunityVersionModelToJson(this);
}
