import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_github/view/searching_page_view.dart';
import 'package:search_github/componet/search_text_field.dart';
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
  final SearchRepositoryPageViewModel _vm = SearchRepositoryPageViewModel();
  @override
  void initState() {
    super.initState();
    _vm.setRef(ref);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(L10n.of(context)!.title)),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              children: [
                SearchTextField(
                  key: const Key("searchTextField"),
                  onFocusChange: (val) {
                    if (val) {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              pageBuilder: (_, __, ___) =>
                                  const SearchingPageView()));
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
