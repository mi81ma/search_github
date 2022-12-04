import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'owner.freezed.dart';
part 'owner.g.dart';

@freezed
abstract class Owner with _$Owner {
  const factory Owner({
    String? login,
    int? id,
    @JsonKey(name: 'node_id') String? nodeId,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'gravatar_id') String? gravatarId,
    String? url,
    @JsonKey(name: 'html_url') String? htmlUrl,
    @JsonKey(name: 'followers_url') String? followersUrl,
    @JsonKey(name: 'following_url') String? followingUrl,
    @JsonKey(name: 'gists_url') String? gistsUrl,
    @JsonKey(name: 'starred_url') String? starredUrl,
    @JsonKey(name: 'subscriptions_url') String? subscriptionsUrl,
    @JsonKey(name: 'organizations_url') String? organizationsUrl,
    @JsonKey(name: 'repos_url') String? reposUrl,
    @JsonKey(name: 'events_url') String? eventsUrl,
    @JsonKey(name: 'received_events_url') String? receivedEventsUrl,
    String? type,
    @JsonKey(name: 'site_admin') bool? siteAdmin,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
