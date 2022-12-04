import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:search_github/data_model/search_repository_model.dart';
import 'package:search_github/service/github_api_client.dart';

void main() {
  test(
    'API request with GitHub api server',
    () async {
      final client = GithubApiClient();
      final returnData = await client.queryRequest(searchRequest: "rust");
      final data = json.decode(returnData);
      final SearchRepositoryModel result = SearchRepositoryModel.fromJson(data);

      expect(result.items!.first.id, 77338532);
      expect(result.items!.first.nodeId, "MDEwOlJlcG9zaXRvcnk3NzMzODUzMg==");
      expect(result.items!.first.fullName, "cross-rs/cross");
      expect(result.items!.first.private, false);
      expect(result.items!.first.owner.login, "cross-rs");
      expect(result.items!.first.owner.id, 93954236);
      expect(result.items!.first.owner.url,
          "https://api.github.com/users/cross-rs");
      expect(result.items!.first.owner.starredUrl,
          "https://api.github.com/users/cross-rs/starred{/owner}{/repo}");
      expect(result.items!.first.owner.subscriptionsUrl,
          "https://api.github.com/users/cross-rs/subscriptions");

      expect(result.totalCount, 5050);
      expect(result.incompleteResults, false);
    },
  );
}
