// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_repository_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchRepositoryModel _$SearchRepositoryModelFromJson(
    Map<String, dynamic> json) {
  return _SearchRepositoryModel.fromJson(json);
}

/// @nodoc
mixin _$SearchRepositoryModel {
  @JsonKey(name: 'total_count')
  int? get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'incomplete_results')
  bool? get incompleteResults => throw _privateConstructorUsedError;
  @JsonKey(name: 'items')
  List<Item>? get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchRepositoryModelCopyWith<SearchRepositoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchRepositoryModelCopyWith<$Res> {
  factory $SearchRepositoryModelCopyWith(SearchRepositoryModel value,
          $Res Function(SearchRepositoryModel) then) =
      _$SearchRepositoryModelCopyWithImpl<$Res, SearchRepositoryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int? totalCount,
      @JsonKey(name: 'incomplete_results') bool? incompleteResults,
      @JsonKey(name: 'items') List<Item>? items});
}

/// @nodoc
class _$SearchRepositoryModelCopyWithImpl<$Res,
        $Val extends SearchRepositoryModel>
    implements $SearchRepositoryModelCopyWith<$Res> {
  _$SearchRepositoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? incompleteResults = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      incompleteResults: freezed == incompleteResults
          ? _value.incompleteResults
          : incompleteResults // ignore: cast_nullable_to_non_nullable
              as bool?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchRepositoryModelCopyWith<$Res>
    implements $SearchRepositoryModelCopyWith<$Res> {
  factory _$$_SearchRepositoryModelCopyWith(_$_SearchRepositoryModel value,
          $Res Function(_$_SearchRepositoryModel) then) =
      __$$_SearchRepositoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int? totalCount,
      @JsonKey(name: 'incomplete_results') bool? incompleteResults,
      @JsonKey(name: 'items') List<Item>? items});
}

/// @nodoc
class __$$_SearchRepositoryModelCopyWithImpl<$Res>
    extends _$SearchRepositoryModelCopyWithImpl<$Res, _$_SearchRepositoryModel>
    implements _$$_SearchRepositoryModelCopyWith<$Res> {
  __$$_SearchRepositoryModelCopyWithImpl(_$_SearchRepositoryModel _value,
      $Res Function(_$_SearchRepositoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? incompleteResults = freezed,
    Object? items = freezed,
  }) {
    return _then(_$_SearchRepositoryModel(
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      incompleteResults: freezed == incompleteResults
          ? _value.incompleteResults
          : incompleteResults // ignore: cast_nullable_to_non_nullable
              as bool?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchRepositoryModel implements _SearchRepositoryModel {
  const _$_SearchRepositoryModel(
      {@JsonKey(name: 'total_count') this.totalCount,
      @JsonKey(name: 'incomplete_results') this.incompleteResults,
      @JsonKey(name: 'items') final List<Item>? items})
      : _items = items;

  factory _$_SearchRepositoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_SearchRepositoryModelFromJson(json);

  @override
  @JsonKey(name: 'total_count')
  final int? totalCount;
  @override
  @JsonKey(name: 'incomplete_results')
  final bool? incompleteResults;
  final List<Item>? _items;
  @override
  @JsonKey(name: 'items')
  List<Item>? get items {
    final value = _items;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchRepositoryModel(totalCount: $totalCount, incompleteResults: $incompleteResults, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchRepositoryModel &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.incompleteResults, incompleteResults) ||
                other.incompleteResults == incompleteResults) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalCount, incompleteResults,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchRepositoryModelCopyWith<_$_SearchRepositoryModel> get copyWith =>
      __$$_SearchRepositoryModelCopyWithImpl<_$_SearchRepositoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchRepositoryModelToJson(
      this,
    );
  }
}

abstract class _SearchRepositoryModel implements SearchRepositoryModel {
  const factory _SearchRepositoryModel(
          {@JsonKey(name: 'total_count') final int? totalCount,
          @JsonKey(name: 'incomplete_results') final bool? incompleteResults,
          @JsonKey(name: 'items') final List<Item>? items}) =
      _$_SearchRepositoryModel;

  factory _SearchRepositoryModel.fromJson(Map<String, dynamic> json) =
      _$_SearchRepositoryModel.fromJson;

  @override
  @JsonKey(name: 'total_count')
  int? get totalCount;
  @override
  @JsonKey(name: 'incomplete_results')
  bool? get incompleteResults;
  @override
  @JsonKey(name: 'items')
  List<Item>? get items;
  @override
  @JsonKey(ignore: true)
  _$$_SearchRepositoryModelCopyWith<_$_SearchRepositoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
