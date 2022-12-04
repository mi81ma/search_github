// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_repository_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchRepositoryModel _$$_SearchRepositoryModelFromJson(
        Map<String, dynamic> json) =>
    _$_SearchRepositoryModel(
      totalCount: json['total_count'] as int?,
      incompleteResults: json['incomplete_results'] as bool?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SearchRepositoryModelToJson(
        _$_SearchRepositoryModel instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'incomplete_results': instance.incompleteResults,
      'items': instance.items,
    };
