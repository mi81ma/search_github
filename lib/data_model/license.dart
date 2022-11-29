import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'license.freezed.dart';
part 'license.g.dart';

@freezed
abstract class License with _$License {
  const factory License({
    String? key,
    String? name,
    String? spdxId,
    String? url,
    String? nodeId,
  }) = _License;

  factory License.fromJson(Map<String, String?> json) =>
      _$LicenseFromJson(json);
}
