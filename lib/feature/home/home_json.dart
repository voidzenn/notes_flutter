import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample/feature/note.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Note> notes = [
    Note(title: "123", text: "123"),
    Note(title: "123", text: "123"),
  ];
  var dataArr = [];

  Future<String> getJsonData() async {
    return await rootBundle.loadString('assets/data.json');
  }

  Future loadSync() async {
    final data = await getJsonData();
    final jsonData = json.decode(data);
    final resData = jsonData;
    // print(resData['data'].map((dat) { return dat['title']; } ));
    setState(() {
      dataArr = resData['data'];
    });
    // return resData['data'];
  }

  Widget cardTemplate(data) {
    var newData = data;
    final rnd = math.Random();
    Color getRandomColor() {
      return Color(rnd.nextInt(0xffffffff));
    }

    delete(data) {
      newData.remove(data);
    }

    return Card(
      color: getRandomColor(),
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '${data['title']} - ${data['text']}',
              style: const TextStyle(
                fontFamily: 'SecularOneRegular',
                fontSize: 12.0,
              ),
            ),
            deleteButton(),
          ],
        ),
      ),
    );
  }

  Widget deleteButton() {
    return ElevatedButton(
        onPressed: (){},
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ));
  }

  @override
  void initState() {
    loadSync();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(dataArr.map((data) => data['title']).toList());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Notes',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.white,
              fontFamily: 'SecularOneRegular',
            )),
      ),
      body: Column(
        children: dataArr.map((data) => cardTemplate(data)).toList(),
      ),
      // body: dataArr.map((dat) => NoteCard(val: dat.title));
    );
  }
}
