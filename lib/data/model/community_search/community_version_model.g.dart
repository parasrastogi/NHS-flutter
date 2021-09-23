// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_version_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityVersionModel _$CommunityVersionModelFromJson(
    Map<String, dynamic> json) {
  return CommunityVersionModel(
    communityID: json['communityID'] as int,
    dBVersion: json['dBVersion'] as int,
    bDXCommunityID: json['bDXCommunityID'] as int,
  );
}

Map<String, dynamic> _$CommunityVersionModelToJson(
        CommunityVersionModel instance) =>
    <String, dynamic>{
      'communityID': instance.communityID,
      'dBVersion': instance.dBVersion,
      'bDXCommunityID': instance.bDXCommunityID,
    };
