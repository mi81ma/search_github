import 'dart:core';
import 'dart:developer';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_github/data_model/item.dart';
import 'package:search_github/view_model/search_page_view_model.dart';
import 'package:search_github/utils/size_config.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class SearchPageView extends ConsumerStatefulWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchPageView> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends ConsumerState<SearchPageView> {
  late final SearchPageViewModel _vm;

  @override
  void initState() {
    super.initState();
    _vm = SearchPageViewModel();

    _vm.setRef(ref);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final searchWord = ref.watch(searchWordProvider);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Center(
                          child: Text(
                            L10n.of(context)!.title,
                            style: const TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    onEditingComplete: _vm.onEditingComplete,
                    controller: _vm.searchWordEditingController,
                    onTap: () async {},
                    autofocus: false,
                    textInputAction: TextInputAction.done,
                    key: const Key('searchTextField'),
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
                      hintText: L10n.of(context) != null
                          ? L10n.of(context)!.search
                          : "Search Github",
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black38,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => _vm.clear(), //リセット処理
                        icon: const Icon(Icons.clear),
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (searchWord != null && searchWord != "") ...[
                    ref.watch(apiFamilyProvider(searchWord)).when(
                          data: (data) => RefreshIndicator(
                            onRefresh: () async {
                              ref.refresh(apiFamilyProvider(searchWord));
                            },
                            child: SizedBox(
                              height: SizeConfig.safeBlockVertical! * 100 - 180,
                              width: SizeConfig.safeBlockHorizontal! * 100 - 24,
                              child: Scrollbar(
                                child: ListView(children: [
                                  for (final oneData in data)
                                    if (oneData.fullName != null &&
                                        oneData.fullName != "")
                                      searchItem(
                                        fullName: oneData.fullName ?? "",
                                        description: oneData.description ?? "",
                                        stargazersCount:
                                            oneData.stargazersCount != null
                                                ? "${oneData.stargazersCount}"
                                                : "",
                                        language: oneData.language ?? "",
                                        itemData: oneData,
                                      )
                                ]),
                              ),
                            ),
                          ),
                          error: (error, stack) {
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Text('Error: $error'),
                                const SizedBox(
                                  height: 30,
                                ),
                                OutlinedButton(
                                  onPressed: () async {
                                    ref.refresh(apiFamilyProvider(searchWord));
                                  },
                                  style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          color: Colors.blue, width: 2),
                                      minimumSize: const Size(200, 40)),
                                  child: const Text(
                                    'Refresh Data',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 20),
                                  ),
                                ),
                              ],
                            );
                          },
                          loading: () => Center(
                            child: Column(
                              children: [
                                Container(
                                  height: 20,
                                ),
                                const CircularProgressIndicator(),
                              ],
                            ),
                          ),
                        )
                  ],
                ],
              ),
            ),
          ),
        ));
  }

  Padding searchItem({
    required String fullName,
    required String description,
    required String stargazersCount,
    required String language,
    required Item itemData,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          key: const Key('search_item'),
          onTap: () =>
              {_vm.onTap(itemData: itemData), debugPrint("onTap title")},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.book_outlined,
                    key: Key("book_icon"),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 100 - 192,
                    child: AutoSizeText(
                      // "flutter/flutter",
                      fullName,
                      key: const Key('full_name'),
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto'),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: AutoSizeText(
                  description,
                  textAlign: TextAlign.left,
                  key: const Key("description"),
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto'),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.star_border,
                    key: Key("star_icon"),
                    color: Colors.black38,
                  ),
                  AutoSizeText(
                    stargazersCount,
                    key: const Key("stargazers_count"),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto'),
                  ),
                  const SizedBox(width: 15),
                  // programming langage color circle
                  Row(
                    children: [
                      Container(
                        width: 13,
                        height: 13,
                        key: const Key("circle_icon"),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  Container(width: 5),
                  AutoSizeText(
                    language,
                    key: const Key("language"),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(
                key: Key("divider"),
                color: Colors.black38,
                thickness: 0.5,
                height: 8,
              )
            ],
          )),
    );
  }

  // final _list = [
  //   SearchResultListItem(
  //     onTapTitle: () => {_vm.onTap()},
  //     fullName: "flutter/flutter",
  //     description:
  //         "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
  //     stargazersCount: "16,530",
  //     language: "Dart",
  //   ),
  // ];
}
