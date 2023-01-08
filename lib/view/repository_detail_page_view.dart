/*-----------------------
This page displays the details of the repository (repository name, owner icon, project language, number of Stars, Watchers, Forks, and Issues).
該当リポジトリの詳細（リポジトリ名、オーナーアイコン、プロジェクト言語、Star 数、Watcher 数、Fork 数、Issue 数）を表示するページです。
------------------------*/

import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_github/widget/repository_detail_item.dart';
import 'package:search_github/widget/search_result_list_item.dart';
import 'package:search_github/widget/size_config.dart';

class RepositoryDetailPageView extends ConsumerStatefulWidget {
  const RepositoryDetailPageView({
    super.key,
  });

  @override
  ConsumerState<RepositoryDetailPageView> createState() =>
      _RepositoryDetailPageViewState();
}

class _RepositoryDetailPageViewState
    extends ConsumerState<RepositoryDetailPageView> {
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              RepositoryDetailItem(
                ownerIconUrl:
                    'https://avatars.githubusercontent.com/u/14101776?v=4',
                repositoryName: "flutter/flutter",
                stargazersCount: '1234567',
                projectLanguage: 'Dart',
                watchersCount: '1234567',
                forksCount: '1234567',
                openIssuesCount: '1234567',
              )
            ],
          ),
        ),
      ),
    );
  }
}
