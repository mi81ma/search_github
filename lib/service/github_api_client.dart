import 'dart:ffi';

import 'package:http/http.dart' as http;

class GithubApiClient {
  Future<dynamic> queryRequest(
      {required String searchRequest, required int resultsPerPage}) async {
    final requestString = '''
https://api.github.com/search/repositories?q=$searchRequest&order=desc&per_page=100&page=1
''';
    var request = http.Request('GET', Uri.parse(requestString));

    http.StreamedResponse response = await request.send();

    switch (response.statusCode) {
      case 200:
        return await response.stream.bytesToString();

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
        return response.reasonPhrase;
    }
  }
}
