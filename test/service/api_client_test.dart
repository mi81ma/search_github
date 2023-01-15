///----------------------------------------------
/// Reference: https://zuma-lab.com/posts/flutter-mock-web-server-unit-test
/// ---------------------------------------------
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:search_github/service/api_client.dart';

void main() {
  final _server = MockWebServer(port: 8081);
  late ApiClient _apiClient;

  setUp(() {
    _apiClient = ApiClientImpl(baseUrl: 'http://127.0.0.1:8081');
    _server.start();
  });

  tearDown(_server.shutdown);

  group('API client communication testing', () {
    test('Http status code "200 OK" with get method testing', () async {
      _server.enqueue(httpCode: 200, body: '{ "message" : "Testing for get" }');
      final responseBody = await _apiClient.get('/endpoint');
      expect(responseBody, '{ "message" : "Testing for get" }');
      final request = _server.takeRequest();
      expect(request.uri.path, '/endpoint');
    });

    test('Http status code "201 Created" with put method testing', () async {
      _server.enqueue(httpCode: 201, body: '{ "title" : "Testing for put" }');
      final responseBody = await _apiClient.put('/endpoint',
          body: '{ "title" : "Testing for put" }');
      expect(responseBody, '{ "title" : "Testing for put" }');
      final request = _server.takeRequest();
      expect(request.uri.path, '/endpoint');
      expect(request.body, '{ "title" : "Testing for put" }');
    });

    test('Http status code "204 No Content" with post method testing',
        () async {
      _server.enqueue(httpCode: 204);
      final responseBody = await _apiClient.post(
        '/endpoint',
        '{ "title" : "Testing for post" }',
      );
      expect(responseBody, isEmpty);
      final request = _server.takeRequest();
      expect(request.uri.path, '/endpoint');
      expect(request.body, '{ "title" : "Testing for post" }');
    });

    test('Http status code 4XX testing', () async {
      for (var i = 0; i < 19; i++) {
        final statusCode = int.parse('40$i');
        _server.enqueue(httpCode: statusCode);
        expect(() => _apiClient.get('/endpoint'), throwsException);
      }
      final statusCodes = [422, 425, 426, 428, 429, 431, 451];
      for (final statusCode in statusCodes) {
        _server.enqueue(httpCode: statusCode);
        expect(() => _apiClient.get('/endpoint'), throwsException);
      }
    });

    test('Http status code 5XX testing', () async {
      for (var i = 0; i < 9; i++) {
        final statusCode = int.parse('50$i');
        _server.enqueue(httpCode: statusCode);
        expect(() => _apiClient.get('/endpoint'), throwsException);
      }
      final statusCodes = [510, 511];
      for (final statusCode in statusCodes) {
        _server.enqueue(httpCode: statusCode);
        expect(() => _apiClient.get('/endpoint'), throwsException);
      }
    });

    test('Other http status code testing', () async {
      final statusCodes = [300];
      for (final statusCode in statusCodes) {
        _server.enqueue(httpCode: statusCode);
        expect(() => _apiClient.get('/endpoint'), throwsException);
      }
    });
  });
}
