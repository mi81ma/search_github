// View Model
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_github/router/router.dart';
import 'package:search_github/view_model/search_repository_page_view_model.dart';

class SearchingPageViewModel {
  // Get "ref" from View Page
  late final WidgetRef _ref;

  void setRef(WidgetRef ref) async {
    _ref = ref;
  }

  void init() async {
    final searchWord = _ref.watch(searchWordProvider);
    if (searchWord != null) {
      setSearchWordOnTextField(word: searchWord);
    }
  }

  void setSearchWordOnTextField({required String word}) {
    searchWordEditingController.text = word;
  }

  TextEditingController searchWordEditingController = TextEditingController();

  void onEditingComplete() {
    _ref
        .read(searchWordProvider.notifier)
        .update((state) => searchWordEditingController.text);
    routemaster.pop();
  }

  void onTapCancel() {
    routemaster.pop();
  }

  ///-------------------------------
  // Header
  ///-------------------------------
  void backButton() {
    print("press back button");
    routemaster.pop();
  }
}
