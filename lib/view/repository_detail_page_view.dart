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
import 'package:search_github/view_model/repository_detail_page_view_model.dart';
import 'package:search_github/widget/repository_detail_item.dart';
import 'package:search_github/utils/size_config.dart';

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
  late final RepositoryDetailPageViewModel _vm;

  @override
  void initState() {
    super.initState();
    _vm = RepositoryDetailPageViewModel();

    _vm.setRef(ref);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Repository Detail"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (_vm.itemData() != null) ...[
                  RepositoryDetailItem(
                    ownerIconUrl: _vm.itemData()!.owner.avatarUrl,
                    repositoryName: _vm.itemData()!.fullName,
                    stargazersCount: _vm.itemData()!.stargazersCount,
                    projectLanguage: _vm.itemData()!.language,
                    watchersCount: _vm.itemData()!.watchersCount,
                    forksCount: _vm.itemData()!.forksCount,
                    openIssuesCount: _vm.itemData()!.openIssuesCount,
                  )
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
