import 'package:flutter/material.dart';
import 'package:sample/util/routes.dart';

class BaseAppBar extends StatelessWidget implements PreferredSize {
  final String title;

  const BaseAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var routes = Routes();

    return AppBar(
      title: Text(
        routes.currentRoute(ModalRoute.of(context)?.settings.name),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'SecularOneRegular',
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
