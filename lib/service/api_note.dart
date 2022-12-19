import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample/service/api_request.dart';

class ApiNote {
  var request = ApiRequest();

  Future<List> getNotes() async {
    // String newPath = '/notes?_sort=id&_order=desc,asc';
    var response = await http.get(request.httpUrl('/notes'));
    return jsonDecode(response.body);
  }

  Future postNote({required String title, required String text}) async {
    var data = {"title": title, "text": text};
    var response = await http.post(request.httpUrl('/notes'), body: data);
    return response;
  }

  Future updateNote(
      {required int id, required String title, required String text}) async {
    var data = {"title": title, "text": text};
    var response = await http.put(request.httpUrl('/notes/$id'), body: data);
    return response;
  }

  Future deleteNote(int id) async {
    var response = await http.delete(request.httpUrl('/notes/$id'));
    return response;
  }
}
