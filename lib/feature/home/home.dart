import 'package:flutter/material.dart';
import 'package:sample/custom_widget/cw_card.dart';
import 'package:sample/feature/view_edit/view_edit_arguments.dart';
import 'package:sample/routes/route_home_arguments.dart';
import 'package:sample/service/api_note.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeLocalApiState();
}

class _HomeLocalApiState extends State<Home> {
  List apiData = [];
  var request = ApiNote();

  initData() async {
    var postData = await request.getNotes();
    setState(() {
      apiData = postData;
    });
  }

  Future deletePost(int id) async {
    var response = await request.deleteNote(id);
    if (response.statusCode == 200) {
      setState(() {
        initData();
      });
    } else {
      print('error in deleting data');
    }
    // print(id);
  }

  viewNote(int id, String title, String text) {
    Navigator.of(context)
        .pushNamed('/view_edit', arguments: ViewEditArguments(id, title, text));
  }

  delete(int id) {
    deletePost(id);
  }

  Widget deleteButton(int id) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              delete(id);
            },
            child: const Padding(
                padding: EdgeInsets.all(5), child: Icon(Icons.delete)),
          )
        ],
      ),
    );
  }

  Widget cardText(data) {
    return Text('${data['title']} - ${data['text']}',
        style: const TextStyle(
          fontFamily: 'SecularOneRegular',
          fontSize: 20.0,
          color: Colors.white,
        ));
  }

  Widget bodyTemplate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: apiData
          .map(
            (data) =>
            InkWell(
              onTap: () {
                viewNote(data['id'], data['title'], data['text']);
              },
              child: CwCard(
                widget: cardText(data),
                button: deleteButton(data['id']),
              ),
            ),
      )
          .toList(),
    );
  }

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return bodyTemplate();
  }
}
