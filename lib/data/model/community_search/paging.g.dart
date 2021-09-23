// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paging _$PagingFromJson(Map<String, dynamic> json) {
  return Paging(
    pageSize: json['pageSize'] as int?,
    sortBy: json['sortBy'] as String?,
    sortSecondBy: json['sortSecondBy'] as String?,
    sortFirstBy: json['sortFirstBy'] as String?,
    page: json['page'] as int?,
    sortOrder: json['sortOrder'] as bool?,
    sortSecondOrder: json['sortSecondOrder'] as bool?,
  );
}

Map<String, dynamic> _$PagingToJson(Paging instance) => <String, dynamic>{
      'pageSize': instance.pageSize,
      'sortBy': instance.sortBy,
      'sortSecondBy': instance.sortSecondBy,
      'sortFirstBy': instance.sortFirstBy,
      'page': instance.page,
      'sortOrder': instance.sortOrder,
      'sortSecondOrder': instance.sortSecondOrder,
    };
