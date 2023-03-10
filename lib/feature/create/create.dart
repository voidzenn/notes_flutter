import 'package:flutter/material.dart';
import 'package:sample/custom_widget/cw_dialog.dart';
import 'package:sample/service/api_note.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final titleInputController = TextEditingController();
  final textInputController = TextEditingController();
  final request = ApiNote();

  String titleInput = '';
  String textInput = '';

  openDialog({required Widget widgetBody}) {
    showDialog(
        context: context,
        builder: (context) => CwDialog(title: "Message", content: widgetBody));
  }

  handleSave({required String inputTitle, required String inputText}) async {
    bool inputEmpty = inputTitle.isEmpty || inputText.isEmpty;
    String textBody = '';
    bool isError = false;

    errorMsg() {
      textBody = 'Error. Please try again';
      isError = true;
    }

    emptyMessage() {
      textBody = 'Field cannot be blank';
      isError = true;
    }

    if (!inputEmpty) {
      var response = await request.postNote(title: inputTitle, text: inputText);
      if (response?.statusCode == 201 || response?.statusCode == 200) {
        textBody = 'Successfully created note';
      } else {
        errorMsg();
      }
    } else {
      emptyMessage();
    }

    openDialog(
        widgetBody: Text(
      textBody,
      style: TextStyle(
          color: !isError ? Colors.lightGreen : Colors.red,
          fontWeight: FontWeight.bold),
    ));
  }

  Widget createTitleTemplate() {
    return TextField(
        controller: titleInputController,
        decoration: const InputDecoration(hintText: "Title"));
  }

  Widget createTextTemplate() {
    return TextField(controller: textInputController);
  }

  Widget saveButtonTemplate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: ElevatedButton(
            onPressed: () {
              handleSave(
                  inputTitle: titleInputController.text,
                  inputText: textInputController.text);
              titleInputController.clear();
              textInputController.clear();
            },
            child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 20),
                )),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            createTitleTemplate(),
            createTextTemplate(),
            saveButtonTemplate()
          ],
        ));
  }
}
