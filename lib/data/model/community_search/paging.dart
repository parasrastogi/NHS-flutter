import 'package:json_annotation/json_annotation.dart';

part 'paging.g.dart';

@JsonSerializable()
class Paging {
  int? pageSize;
  String? sortBy;
  String? sortSecondBy;
  String? sortFirstBy;
  int? page;
  bool? sortOrder;
  bool? sortSecondOrder;

  Paging({
    this.pageSize,
    this.sortBy,
    this.sortSecondBy,
    this.sortFirstBy,
    this.page,
    this.sortOrder,
    this.sortSecondOrder,
  });

  factory Paging.fromJson(Map<String, dynamic> json) => _$PagingFromJson(json);

  Map<String, dynamic> toJson() => _$PagingToJson(this);
}
