// View Model
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_github/router/router.dart';

class SearchRepositoryPageViewModel {
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
}

final searchWordProvider = StateProvider<String?>((ref) => null);
