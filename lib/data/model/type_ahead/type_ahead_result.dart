import 'package:json_annotation/json_annotation.dart';
import 'package:newhomesource/data/model/type_ahead/type_ahead_model.dart';

part 'type_ahead_result.g.dart';

@JsonSerializable()
class TypeAheadResult {
  @JsonKey(name: 'Model')
  final List<TypeAheadModel> typeAheadList;

  TypeAheadResult({
    required this.typeAheadList,
  });

  factory TypeAheadResult.fromJson(Map<String, dynamic> json) =>
      _$TypeAheadResultFromJson(json);
  Map<String, dynamic> toJson() => _$TypeAheadResultToJson(this);
}
