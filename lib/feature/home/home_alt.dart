import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeAlt extends StatefulWidget {
  const HomeAlt({Key? key}) : super(key: key);

  @override
  State<HomeAlt> createState() => _HomeAltState();
}

class _HomeAltState extends State<HomeAlt> {
  List apiData = [];

  Future getApiData() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/todos');
    var response = await http.get(url);
    List dataToJson = jsonDecode(response.body);
    setState(() {
      apiData = dataToJson;
    });
  }

  Widget cardTemplate(data) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        child: Text(
          '${data['title']}',
          style: const TextStyle(
            fontFamily: 'SecularOneRegular',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget bodyTemplate() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: apiData
            .map((data) {
              return cardTemplate(data);
            })
            .take(10)
            .toList(),
      ),
    );
  }

  @override
  void initState() {
    getApiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Sample"),
      ),
      body: SingleChildScrollView(
        child: bodyTemplate(),
      ),
    );
  }
}
