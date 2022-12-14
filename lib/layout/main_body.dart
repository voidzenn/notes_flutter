import 'package:flutter/material.dart';
import 'package:sample/layout/base_app_bar.dart';
import 'package:sample/util/routes.dart';

class MainBody extends StatefulWidget {
  final Widget child;

  const MainBody({Key? key, required this.child}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  Future getCurrentRoute() async {
    return ModalRoute.of(context)?.settings.name;
  }

  @override
  Widget build(BuildContext context) {
    var routes = Routes();

    floatingButtonEnabled() {
      return routes.isHome(ModalRoute.of(context)?.settings.name);
    }

    return Scaffold(
      appBar: const BaseAppBar(title: "Notes"),
      body: SingleChildScrollView(
        child: Column(
          children: [widget.child],
        ),
      ),
      floatingActionButton: Opacity(
        opacity: floatingButtonEnabled() ? 1 : 0,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/create');
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(24),
          ),
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
