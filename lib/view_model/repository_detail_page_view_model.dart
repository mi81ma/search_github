// View Model
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_github/data_model/item.dart';
import 'package:search_github/view_model/search_page_view_model.dart';

class RepositoryDetailPageViewModel {
  late final WidgetRef _ref;

  void setRef(WidgetRef ref) async {
    _ref = ref;
  }

  Item? itemData() => _ref.watch(detailPageDataProvider);
}
