import 'package:flutter/material.dart';
import 'package:sample/feature/create/create.dart';
import 'package:sample/feature/home/home.dart';
import 'package:sample/layout/main_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const Home(),
        // home: const HomeAlt(),
        home: const MainBody(child: Home()),
        routes: {
          '/create': (_) => const MainBody(child: Create()),
        });
  }
}
