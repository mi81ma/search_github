import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_github/main.dart';
import 'package:search_github/widget/search_result_list_item.dart';
import 'package:search_github/widget/search_text_field.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:search_github/widget/size_config.dart';

class SearchingPageView extends ConsumerStatefulWidget {
  const SearchingPageView({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchingPageView> createState() => _SearchingPageViewState();
}

class _SearchingPageViewState extends ConsumerState<SearchingPageView> {
  final _focusNode = FocusNode();
  // The message to display.
  String? _message;
// Handles the key events from the Focus widget and updates the
// _message.
  KeyEventResult _handleKeyEvent(FocusNode node, RawKeyEvent event) {
    setState(() {
      if (event.logicalKey == LogicalKeyboardKey.keyQ) {
        _message = 'Pressed the "Q" key!';
      } else {
        if (kReleaseMode) {
          _message =
              'Not a Q: Pressed 0x${event.logicalKey.keyId.toRadixString(16)}';
          print(_message);
        } else {
          // As the name implies, the debugName will only print useful
          // information in debug mode.
          _message = 'Not a Q: Pressed ${event.logicalKey.debugName}';
          print(_message);
        }
      }
    });
    return event.logicalKey == LogicalKeyboardKey.keyQ
        ? KeyEventResult.handled
        : KeyEventResult.ignored;
  }

  @override
  void initState() {
    super.initState();
  }

  var _list = [
    const SearchResultListItem(
      fullName: "flutter/flutter",
      description:
          "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
      stargazersCount: "16,530",
      language: "Dart",
    ),
    //----- test --------
    const SearchResultListItem(
      fullName: "flutter/flutter",
      description:
          "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
      stargazersCount: "16,530",
      language: "Dart",
    ),
    //----- test --------
    const SearchResultListItem(
      fullName: "flutter/flutter",
      description:
          "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
      stargazersCount: "16,530",
      language: "Dart",
    ),
    //----- test --------
    const SearchResultListItem(
      fullName: "flutter/flutter",
      description:
          "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
      stargazersCount: "16,530",
      language: "Dart",
    ),
    //----- test --------
    const SearchResultListItem(
      fullName: "flutter/flutter",
      description:
          "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
      stargazersCount: "16,530",
      language: "Dart",
    ),
    //----- test --------
    const SearchResultListItem(
      fullName: "flutter/flutter",
      description:
          "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
      stargazersCount: "16,530",
      language: "Dart",
    ),
    //----- test --------
    const SearchResultListItem(
      fullName: "flutter/flutter",
      description:
          "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
      stargazersCount: "16,530",
      language: "Dart",
    ),
    //----- test --------
    const SearchResultListItem(
      fullName: "flutter/flutter",
      description:
          "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
      stargazersCount: "16,530",
      language: "Dart",
    ),
    //----- test --------
    const SearchResultListItem(
      fullName: "flutter/flutter",
      description:
          "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
      stargazersCount: "16,530",
      language: "Dart",
    ),
    //----- test --------
    const SearchResultListItem(
      fullName: "flutter/flutter",
      description:
          "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
      stargazersCount: "16,530",
      language: "Dart",
    ),
    //----- test --------
    const SearchResultListItem(
      fullName: "flutter/flutter",
      description:
          "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
      stargazersCount: "16,530",
      language: "Dart",
    ),
    //----- test --------
    const SearchResultListItem(
      fullName: "flutter/flutter",
      description:
          "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
      stargazersCount: "16,530",
      language: "Dart",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              Focus(
                onKey: _handleKeyEvent,
                child: AnimatedBuilder(
                  animation: _focusNode,
                  builder: (BuildContext context, Widget? child) {
                    return SearchTextField(
                      onEditingComplete: () {
                        print("onEditingComplete");
                        FocusScope.of(context).unfocus();
                      },
                      isAutoFocus: true,
                      onCancel: () {
                        FocusScope.of(context).unfocus();
                        Navigator.pop(context);
                      },
                      inputDecoration: InputDecoration(
                          focusColor: null,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 1))),
                    );
                  },
                ),
              ),
              //----- test --------
              Expanded(
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: _list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _list[index];
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
