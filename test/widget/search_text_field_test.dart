import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:search_github/main.dart';
import 'package:search_github/view/searching_page_view.dart';
import 'package:search_github/componet/search_text_field.dart';

void main() {
  testWidgets("SearchTextField", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SearchTextField(),
      ),
    );

    await tester.pump();

    expect(find.byType(SearchTextField), findsOneWidget);
  });

  testWidgets("SearchTextField on MyApp", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();
    expect(find.byType(SearchTextField), findsOneWidget);
  });

  testWidgets("SearchTextField input text", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SearchTextField(),
      ),
    );

    final searchTextField = find.byType(SearchTextField);

    await tester.pump();
    await tester.enterText(searchTextField, 'Hello');
    expect(find.text('Hello'), findsOneWidget);

    await tester.pump();
    await tester.enterText(searchTextField, 'こんにちは');
    expect(find.text('こんにちは'), findsOneWidget);
  });

  testWidgets('SearchTextField Focus triggers keep-alive',
      (WidgetTester tester) async {
    FocusNode focusNode = FocusNode();

    await tester.pumpWidget(
      MaterialApp(
        home: SearchTextField(focusNode: focusNode),
      ),
    );

    await tester.tap(find.byType(SearchTextField));

    expect(find.byType(SearchTextField), findsOneWidget);
    // expect(tester.testTextInput.isVisible, isFalse);

    FocusScope.of(tester.element(find.byType(SearchTextField)))
        .requestFocus(focusNode);
    await tester.pump();
    expect(find.byType(SearchTextField), findsOneWidget);
    expect(tester.testTextInput.isVisible, isTrue);

    focusNode.unfocus();
    await tester.pump();
    expect(find.byType(SearchTextField), findsOneWidget);
    expect(tester.testTextInput.isVisible, isFalse);

    // Tap forcus
    await tester.tap(find.byType(SearchTextField));
    expect(find.byType(SearchTextField), findsOneWidget);
    expect(tester.testTextInput.isVisible, isTrue);
  });

  testWidgets('SearchTextField cancel button', (WidgetTester tester) async {
    FocusNode focusNode = FocusNode();

    await tester.pumpWidget(
      const MaterialApp(
        home: SearchScreen(),
      ),
    );

    await tester.pump();

    await tester.tap(find.byType(SearchTextField));
    expect(find.byType(SearchTextField), findsOneWidget);

    FocusScope.of(tester.element(find.byType(SearchTextField)))
        .requestFocus(focusNode);

    expect(find.byType(SearchTextField), findsOneWidget);
    expect(tester.testTextInput.isVisible, isTrue);

    expect(find.byType(GestureDetector), findsOneWidget);

    // tap cancel button
    await tester.tap(find.byKey(const ValueKey("cancelFocus")));
    expect(tester.testTextInput.isVisible, isFalse);
  });
}
