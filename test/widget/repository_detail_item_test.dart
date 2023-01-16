import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_github/widget/repository_detail_item.dart';
import 'package:network_image_mock/network_image_mock.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Image.network('https://example.com/some_image.jpg'),
    );
  }
}

void main() {
  testWidgets(
    'should properly mock Image.network and not crash',
    (WidgetTester tester) async {
      mockNetworkImagesFor(() => tester.pumpWidget(MyApp()));
    },
  );

  testWidgets(
    "SearchResultListItem has elements with network image",
    (WidgetTester tester) async {
      mockNetworkImagesFor(() {
        String path = 'https://avatars.githubusercontent.com/u/14101776?v=4';
        tester.pumpWidget(
          RepositoryDetailItem(
            ownerIconUrl: path,
            repositoryName: "flutter/flutter",
            stargazersCount: 1234567,
            projectLanguage: 'Dart',
            watchersCount: 1234567,
            forksCount: 1234567,
            openIssuesCount: 1234567,
          ),
        );

        // オーナーアイコン URL (avatar_url)
        expect(find.byKey(const Key("owner_icon")), findsOneWidget);

        // リポジトリ名 (full_name)
        expect(find.byKey(const Key("repository_name")), findsOneWidget);

        // Star 数 (stargazers_count)
        expect(find.byKey(const Key("stargazers_count_title")), findsOneWidget);
        expect(find.byKey(const Key("star_icon")), findsOneWidget);
        expect(find.byKey(const Key("stargazers_count")), findsOneWidget);

        // プロジェクト言語 (language)
        expect(find.byKey(const Key("project_language_title")), findsOneWidget);
        expect(find.byKey(const Key("circle_icon")), findsOneWidget);
        expect(find.byKey(const Key("language")), findsOneWidget);

        // Watcher 数 (watchers)
        expect(find.byKey(const Key("watchers_title")), findsOneWidget);
        expect(find.byKey(const Key("watchers_icon")), findsOneWidget);
        expect(find.byKey(const Key("watchers_count")), findsOneWidget);

        // Fork 数 (forks_count)
        expect(find.byKey(const Key("fork_count_title")), findsOneWidget);
        expect(find.byKey(const Key("fork_icon")), findsOneWidget);
        expect(find.byKey(const Key("forks_count")), findsOneWidget);

        // Issue 数 (open_issues_count)
        expect(find.byKey(const Key("issue_title")), findsOneWidget);
        expect(find.byKey(const Key("issue_icon")), findsOneWidget);
        expect(find.byKey(const Key("open_issues_count")), findsOneWidget);
      });
    },
  );
}
