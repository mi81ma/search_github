import 'dart:core';
import 'dart:developer';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_github/router/router.dart';
import 'package:search_github/widget/search_result_list_item.dart';
import 'package:search_github/widget/size_config.dart';
import 'package:search_github/view/searching_page_view.dart';
import 'package:search_github/widget/search_text_field.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:search_github/view_model/search_repository_page_view_model.dart';

class SearchRepositoryPageView extends ConsumerStatefulWidget {
  const SearchRepositoryPageView({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchRepositoryPageView> createState() =>
      _SearchRepositoryPageViewState();
}

class _SearchRepositoryPageViewState
    extends ConsumerState<SearchRepositoryPageView> {
  late final SearchRepositoryPageViewModel _vm;

  @override
  void initState() {
    super.initState();
    _vm = SearchRepositoryPageViewModel();

    _vm.setRef(ref);
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
              controller: _vm.searchWordEditingController,
              onTap: () async {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    pageBuilder: (_, __, ___) => const SearchingPageView(),
                  ),
                );
              },
              autofocus: false,
              textInputAction: TextInputAction.done,
              key: const Key('secondTextField'),
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
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.blue, width: 1),
                ),
              ),
            ),

            //----- test --------
            Expanded(
              child: Scrollbar(
                  child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => {_vm.onTap(), debugPrint("onTap title")},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(height: 8),
                              const Icon(
                                Icons.book_outlined,
                                key: Key("book_icon"),
                              ),
                              const SizedBox(width: 8),
                              const AutoSizeText(
                                // "flutter/flutter",
                                "flutter/flutter",
                                key: Key('full_name'),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const SizedBox(
                            width: double.infinity,
                            child: AutoSizeText(
                              "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
                              textAlign: TextAlign.left,
                              key: Key("description"),
                              style: TextStyle(
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
                              const AutoSizeText(
                                "16,530",
                                key: Key("stargazers_count"),
                                style: TextStyle(
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
                              const AutoSizeText(
                                "Dart",
                                key: Key("language"),
                                style: TextStyle(
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
                      ),
                    ),
                  ),
                ],
              )
                  // ListView.builder(
                  //   itemCount: _list.length,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return _list[index];
                  //   },
                  // ),
                  ),
            ),
          ],
        ),
      ),
    ));
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
