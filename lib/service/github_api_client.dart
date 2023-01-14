import 'dart:ffi';

import 'package:http/http.dart' as http;

class GithubApiClient {
  Future<http.Response> queryRequest({
    required String searchWords,
    required int resultsPerPage,
  }) async {
    final apiUrl = '''
https://api.github.com/search/repositories?q=$searchWords&order=desc&per_page=$resultsPerPage&page=1
''';
    final apiUri = Uri.parse(apiUrl);
    http.Response response = await http.get(apiUri);

    return response;
  }
}
