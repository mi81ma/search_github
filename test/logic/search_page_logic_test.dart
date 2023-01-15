import 'package:flutter_test/flutter_test.dart';
import 'package:search_github/data_model/item.dart';
import 'package:search_github/logic/search_page_logic.dart';

void main() {
  test(
    'API request with GitHub api server',
    () async {
      final client = SearchPageLogic();
      List<Item>? returnData = await client.searchRequest(
          searchWords: "flutter", resultsPerPage: 30);

      // オーナーアイコン URL (avatar_url)
      expect(returnData!.first.owner.avatarUrl,
          "https://avatars.githubusercontent.com/u/14101776?v=4");

      // リポジトリ名 (full_name)
      expect(returnData.first.fullName, "flutter/flutter");

      // Star 数 (stargazers_count)
      expect(returnData.first.stargazersCount, 148336);

      // プロジェクト言語 (language)
      expect(returnData.first.language, "Dart");

      // Watcher 数 (watchers)
      expect(returnData.first.watchers, 148336);

      // Fork 数 (forks_count)
      expect(returnData.first.forksCount, 24262);

      // Issue 数 (open_issues_count)
      expect(returnData.first.openIssuesCount, 11449);
    },
  );

  test(
    'Get Search Api Request',
    () async {
      final client = SearchPageLogic();
      List<Item>? returnData = await client.getSearchApiRequest(
          searchWords: "flutter", resultsPerPage: 30);

      // オーナーアイコン URL (avatar_url)
      expect(returnData!.first.owner.avatarUrl,
          "https://avatars.githubusercontent.com/u/14101776?v=4");

      // リポジトリ名 (full_name)
      expect(returnData.first.fullName, "flutter/flutter");

      // Star 数 (stargazers_count)
      expect(returnData.first.stargazersCount, 148338);

      // プロジェクト言語 (language)
      expect(returnData.first.language, "Dart");

      // Watcher 数 (watchers)
      expect(returnData.first.watchers, 148338);

      // Fork 数 (forks_count)
      expect(returnData.first.forksCount, 24261);

      // Issue 数 (open_issues_count)
      expect(returnData.first.openIssuesCount, 11451);
    },
  );
}
