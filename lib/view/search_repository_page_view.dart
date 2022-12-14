import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  final SearchRepositoryPageViewModel _vm = SearchRepositoryPageViewModel();
  @override
  void initState() {
    super.initState();
    _vm.setRef(ref);
  }

  final _controller = ScrollController();

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
          ],
        ),
      ),
    ));
  }
}
