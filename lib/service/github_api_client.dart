import 'package:http/http.dart' as http;

class GithubApiClient {
  Future<dynamic> queryRequest({required String searchRequest}) async {
    final requestString = '''
https://api.github.com/search/repositories?q=$searchRequest test&order=desc&per_page=30
''';
    var request = http.Request('GET', Uri.parse(requestString));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      return response.reasonPhrase;
    }
  }
}
