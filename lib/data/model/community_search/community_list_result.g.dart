// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_list_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityListResult _$CommunityListResultFromJson(Map<String, dynamic> json) {
  return CommunityListResult(
    totalCount: json['TotalCount'] as int?,
    totalHomeCount: json['TotalHomeCount'] as int?,
    resultsArray: (json['Model'] as List<dynamic>)
        .map((e) => CommunityModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    errorMessage: json['errorMessage'] as String?,
    error: json['error'] as bool?,
  );
}

Map<String, dynamic> _$CommunityListResultToJson(
        CommunityListResult instance) =>
    <String, dynamic>{
      'TotalCount': instance.totalCount,
      'TotalHomeCount': instance.totalHomeCount,
      'Model': instance.resultsArray,
      'errorMessage': instance.errorMessage,
      'error': instance.error,
    };
