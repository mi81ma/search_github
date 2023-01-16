import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_github/data_model/item.dart';
import 'package:search_github/data_model/items.dart';
import 'package:search_github/service/api_client.dart';
import 'package:search_github/service/github_api_client.dart';
import 'package:search_github/view_model/search_page_view_model.dart';

class SearchPageLogic {
  Future<List<Item>?> searchRequest(
      {required String searchWords, required int resultsPerPage}) async {
    // API Request
    final response = await GithubApiClient()
        .queryRequest(searchWords: searchWords, resultsPerPage: resultsPerPage);

    switch (response.statusCode) {
      case 200:
        return objectMappingJsonToListItem(jsonBody: response.body);
      // final jsonData = json.decode(response.body);
      // final items = Items.fromJson(jsonData);
      // return items.items;
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
      case 510:
        throw Exception('510 Not Extended');
      case 511:
        throw Exception('511 Network Authentication Required');
      default:
        throw Exception('Http status ${response.statusCode} unknown error.');
    }
  }

  // Object Mapping: From Json to List<Item>?
  Future<List<Item>?> objectMappingJsonToListItem(
      {required String jsonBody}) async {
    if (jsonBody.isNotEmpty) {
      final jsonData = await json.decode(jsonBody);
      final items = Items.fromJson(jsonData);
      return items.items;
    }
  }

  // Future<List<Item>?> getSearchApiRequest({
  //   required String searchWords,
  //   required int resultsPerPage,
  // }) async {
  //   // API Request
  //   final apiClient = ApiClientImpl(baseUrl: 'https://api.github.com');
  //   // final apiClient = githubApiClient;
  //   final responseBody = await apiClient.get(
  //       '/search/repositories?q=$searchWords&order=desc&per_page=$resultsPerPage&page=1');

  //   log('responseBody: $responseBody');
  //   return await objectMappingJsonToListItem(jsonBody: responseBody);
  // }

  Future<List<Item>?> getSearchApiRequest({
    ApiClientImpl? apiClientForTest,
    required String searchWords,
    required int resultsPerPage,
  }) async {
    late final String responseBody;
    if (apiClientForTest != null) {
      // Test api string
      responseBody = await apiClientForTest.get(
          '/search/repositories?q=$searchWords&order=desc&per_page=$resultsPerPage&page=1');
    } else {
      // product api string
      final apiClient = ApiClientImpl(baseUrl: 'https://api.github.com');
      responseBody = await apiClient.get(
          '/search/repositories?q=$searchWords&order=desc&per_page=$resultsPerPage&page=1');
    }

    log('responseBody: $responseBody');
    return await objectMappingJsonToListItem(jsonBody: responseBody);
  }
}
