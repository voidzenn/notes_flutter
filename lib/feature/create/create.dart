import 'package:flutter/material.dart';

class Create extends StatelessWidget {
  const Create({Key? key}) : super(key: key);

  Widget createTemplate() {
    return const Text("123");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [createTemplate()],
    );
  }
}
