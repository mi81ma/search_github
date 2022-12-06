// View Model
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_github/router/router.dart';

class SearchRepositoryPageViewModel {
  // Get "ref" from View Page
  late final WidgetRef _ref;

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
