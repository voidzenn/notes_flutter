import 'package:flutter/material.dart';
import 'package:sample/routes/routes.dart';

class BaseAppBar extends StatelessWidget implements PreferredSize {
  final String title;

  const BaseAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var routes = Routes();
    var pathName = ModalRoute.of(context)?.settings.name;

    return AppBar(
      leadingWidth: routes.isHome(pathName) ? 0 : 30,
      leading: Visibility(
        visible: routes.isHome(pathName) ? false : true,
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pushNamed('/'),
        ),
      ),
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
