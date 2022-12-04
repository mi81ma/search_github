import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'item.dart';

part 'search_repository_model.freezed.dart';
part 'search_repository_model.g.dart';

@freezed
abstract class SearchRepositoryModel with _$SearchRepositoryModel {
  const factory SearchRepositoryModel({
    @JsonKey(name: 'total_count') int? totalCount,
    @JsonKey(name: 'incomplete_results') bool? incompleteResults,
    @JsonKey(name: 'items') List<Item>? items,
  }) = _SearchRepositoryModel;

  factory SearchRepositoryModel.fromJson(Map<String, dynamic> json) =>
      _$SearchRepositoryModelFromJson(json);
}
