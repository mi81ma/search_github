import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:search_github/widget/search_result_list_item.dart';

void main() {
  testWidgets("SearchResultListItem has elements", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
          home: SearchResultListItem(
        fullName: "flutter/flutter",
        description:
            "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
        stargazersCount: "16,530",
        language: "Dart",
      )),
    );

    expect(find.byKey(const Key("book_icon")), findsOneWidget);
    expect(find.byKey(const Key("full_name")), findsOneWidget);
    expect(find.byKey(const Key("description")), findsOneWidget);
    expect(find.byKey(const Key("star_icon")), findsOneWidget);
    expect(find.byKey(const Key("stargazers_count")), findsOneWidget);
    expect(find.byKey(const Key("circle_icon")), findsOneWidget);
    expect(find.byKey(const Key("language")), findsOneWidget);
    expect(find.byKey(const Key("divider")), findsOneWidget);
  });

  testWidgets("SearchResultListItem has text values",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
          home: SearchResultListItem(
        fullName: "flutter/flutter",
        description:
            "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
        stargazersCount: "16,530",
        language: "Dart",
      )),
    );

    expect(find.text("flutter/flutter"), findsOneWidget);
    expect(
        find.text(
            "Flutter makes it easy and fast to build beautiful apps for mobile and beyond"),
        findsOneWidget);
    expect(find.text("16,530"), findsOneWidget);
    expect(find.text("Dart"), findsOneWidget);
  });
}
