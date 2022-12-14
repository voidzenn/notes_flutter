import 'dart:convert';

import 'package:sample/service/api_request.dart';
import 'package:http/http.dart' as http;

class ApiNote {
  var request = ApiRequest();

  Future<List> getNotes() async {
    var response = await http.get(request.httpUrl('/notes'));
    return jsonDecode(response.body);
  }

  Future deleteNote(int id) async {
    var response = await http.delete(request.httpUrl('/notes/$id'));
    return response;
  }
}