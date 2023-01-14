import 'dart:convert';

import 'package:search_github/data_model/item.dart';
import 'package:search_github/data_model/items.dart';
import 'package:search_github/service/github_api_client.dart';

class SearchPageLogic {
  Future<List<Item>?> searchRequest(
      {required String searchWords, required int resultsPerPage}) async {
    print("===========================");
    // API Request
    final response = await GithubApiClient()
        .queryRequest(searchWords: searchWords, resultsPerPage: resultsPerPage);
    print("===========================");

    switch (response.statusCode) {
      case 200:
        final jsonData = json.decode(response.body);
        final items = Items.fromJson(jsonData);
        return items.items;
      case 201:
        throw Exception('201 Created');
      case 204:
        throw Exception('204 No Content');
      case 400:
        throw Exception('400 Bad Request');
      case 401:
        throw Exception('401 Unauthorized');
      case 403:
        throw Exception('403 Forbidden');
      case 404:
        throw Exception('404 Not Found');
      case 500:
        throw Exception('500 Internal Server Error');
      default:
        throw Exception('API Erorr: $searchWords');
    }
  }
}
