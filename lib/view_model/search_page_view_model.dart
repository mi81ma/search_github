// View Model
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_github/data_model/item.dart';
import 'package:search_github/logic/search_page_logic.dart';
import 'package:search_github/router/router.dart';
import 'package:search_github/widget/search_result_list_item.dart';

class SearchPageViewModel {
  // Get "ref" from View Page
  late final WidgetRef _ref;

  TextEditingController searchWordEditingController = TextEditingController();

  String get searchWords => _ref.watch(searchWordProvider) ?? "";

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

  Future<void> onEditingComplete() async {
    _ref
        .read(searchWordProvider.notifier)
        .update((state) => searchWordEditingController.text);

    final searchWord = _ref.read(searchWordProvider);
    if (searchWord != null && searchWord != "") {
      final result = _ref.refresh(apiFamilyProvider(searchWord));
      // final result = await apiFamilyProvider(seachWord);
      debugPrint("result: ${result}");
    }

    // -----------------
  }

  /// Submit API Request
  void apiRequestu({required String searchWords}) async {}

  void clear() {
    searchWordEditingController.text = "";
  }
}

final _searchLogicProvider =
    StateProvider<SearchPageLogic>((ref) => SearchPageLogic());
final searchWordProvider = StateProvider<String?>((ref) => null);

// final _searchResultListProvider = StateProvider<List<Item>?>((ref) => null);

AutoDisposeFutureProviderFamily<List<Item>, String> apiFamilyProvider =
    FutureProvider.autoDispose
        .family<List<Item>, String>((ref, searchWords) async {
  final logic = ref.watch(_searchLogicProvider);
  print("001 -------------------------");
  final result = await logic.searchRequest(
    searchWords: searchWords,
    resultsPerPage: 100,
  );

  debugPrint("result: $result");

  if (result == null) {
    return List.empty();
  }

  return result;
});
