import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:search_github/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Text Field', () {
// Test Scenario 01
// TextFieldが画面に表示されているかどうかをテストする。
    testWidgets('Search Text Field', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('searchTextField')), findsOneWidget);
    });

// Test Scenario 02
// TextFieldに文字入力できるかどうかをテストする。
    testWidgets('Enter "flutter" into Search Text Field',
        (WidgetTester tester) async {
      // start App
      app.main();

      // wait for showing up App
      await tester.pumpAndSettle();

      // finder
      final finder = find.byKey(const Key('searchTextField'));

      // Enter 'flutter' into the TextField.
      await tester.enterText(finder, 'flutter');

      // Get text from TextField
      final textField = finder.evaluate().single.widget as TextField;
      final text = textField.controller?.text;

      expect(text, "flutter");
    });
  });

  group('Search word test', () {
// Test Scenario 03
// 文字列'flutter'をテキストフィールドへ入力し、keyboardでdoneボタンを押すと、
// 検索結果のリストが表示されるかどうかをテストする。
    testWidgets('Enter "flutter" and search test', (WidgetTester tester) async {
      // start App
      app.main();

      // wait for showing up App
      await tester.pumpAndSettle();

      // finder
      final finder = find.byKey(const Key('searchTextField'));

      // Enter 'flutter' into the TextField.
      await tester.enterText(finder, 'flutter');

      // Enter done
      await tester.testTextInput.receiveAction(TextInputAction.done);

      // 描画が終わるのを待つ
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();

      // full name
      final finderFlullName = find.byKey(const Key('full_name'));

      expect(finderFlullName, findsWidgets);
    });
  });

// Test Scenario 04
// 文字列'flutter'をテキストフィールドへ入力し、検索結果のリストを表示する。
// 検索結果のリストの1番目のアイテムをタップして、画面遷移させる。
// 画面遷移したあとで、 owner_icon が表示されるかどうかをテストする。
  testWidgets(
      'Enter "flutter" and press search_iten, then page transition & show owner_icon on RepositoryDetailItem',
      (WidgetTester tester) async {
    // start App
    app.main();

    // wait for showing up App
    await tester.pumpAndSettle();

    // TextField finder
    final finderTextField = find.byKey(const Key('searchTextField'));

    // Enter 'flutter' into the TextField.
    await tester.enterText(finderTextField, 'flutter');

    // Enter done
    await tester.testTextInput.receiveAction(TextInputAction.done);

    // wait for searched list
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // search_item finder
    final finderSearchItem = find.byKey(const Key('search_item')).at(0);
    // expect(finderSearchItem, findsWidgets);

    // Tap search_item
    await tester.tap(finderSearchItem);
    await tester.pump();

    // // wait for page transition
    await tester.pumpAndSettle();

    // オーナーアイコン URL (avatar_url)
    expect(find.byKey(const Key("owner_icon")), findsOneWidget);

    // リポジトリ名 (full_name)
    final finderRepositoryName = find.byKey(const Key('repository_name'));
    expect(finderRepositoryName, findsOneWidget);
    final textRepositoryName =
        finderRepositoryName.evaluate().single.widget as AutoSizeText;
    expect(textRepositoryName.data, "flutter/flutter");

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
}
