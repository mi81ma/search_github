// View Model
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_github/router/router.dart';

class SearchPageViewModel {
  // Get "ref" from View Page
  late final WidgetRef _ref;

  TextEditingController searchWordEditingController = TextEditingController();

  ///-------------------------------
  // Header
  ///-------------------------------

  void setRef(WidgetRef ref) async {
    _ref = ref;
  }

  void onTap() {
    routemaster.push('/detail');

    debugPrint("after ontap");
  }

  void onEditingComplete() {
    _ref
        .read(searchWordProvider.notifier)
        .update((state) => searchWordEditingController.text);
    debugPrint(_ref.read(searchWordProvider));
  }
}

final searchWordProvider = StateProvider<String?>((ref) => null);
