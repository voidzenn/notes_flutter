import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:sample/service/api_request.dart';

class ApiPost {
  var request = ApiRequest();

  Future<List> getPost () async {
    var response = await http.get(request.httpUrl('/posts'));
    return jsonDecode(response.body);
  }

  Future deletePost (int id) async {
    var response = await http.delete(request.httpUrl('/posts/$id'));
    return response;
  }
}