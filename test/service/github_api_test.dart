import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:search_github/data_model/search_repository_model.dart';
import 'package:search_github/service/github_api_client.dart';

void main() {
  test(
    'API request with GitHub api server',
    () async {
      final client = GithubApiClient();
      final returnData = await client.queryRequest(
          searchRequest: "flutter", resultsPerPage: 30);
      final data = json.decode(returnData);
      final SearchRepositoryModel result = SearchRepositoryModel.fromJson(data);

      // オーナーアイコン URL (avatar_url)
      expect(result.items!.first.owner.avatarUrl,
          "https://avatars.githubusercontent.com/u/14101776?v=4");

      // リポジトリ名 (full_name)
      expect(result.items!.first.fullName, "flutter/flutter");

      // Star 数 (stargazers_count)
      expect(result.items!.first.stargazersCount, 148184);

      // プロジェクト言語 (language)
      expect(result.items!.first.language, "Dart");

      // Watcher 数 (watchers)
      expect(result.items!.first.watchers, 148184);

      // Fork 数 (forks_count)
      expect(result.items!.first.forksCount, 24210);

      // Issue 数 (open_issues_count)
      expect(result.items!.first.openIssuesCount, 11459);
    },
  );
}
