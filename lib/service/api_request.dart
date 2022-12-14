import 'package:http/http.dart' as http;

class ApiRequest {
  final String baseUrl = 'localhost:3000';

  Uri httpUrl(path) {
    return Uri.http(baseUrl,path);
  }

  Uri httpsUrl(path) {
    return Uri.https(baseUrl, path);
  }
}