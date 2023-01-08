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
  void backButton() {
    print("press back button");
    routemaster.pop();
  }

  void setRef(WidgetRef ref) async {
    _ref = ref;
  }
}

final searchWordProvider = StateProvider<String?>((ref) => null);
