import 'package:flutter/material.dart';
import 'package:sample/custom_widget/cw_dialog.dart';
import 'package:sample/feature/view_edit/view_edit_arguments.dart';
import 'package:sample/service/api_note.dart';

class ViewEdit extends StatefulWidget {
  final String? title;
  final String? text;

  const ViewEdit({Key? key, this.title, this.text}) : super(key: key);

  @override
  State<ViewEdit> createState() => _ViewEditState();
}

class _ViewEditState extends State<ViewEdit> {
  String titleInput = '';
  String textInput = '';
  var request = ApiNote();

  openDialog({required Widget widgetBody}) {
    showDialog(
        context: context,
        builder: (context) => CwDialog(title: "Message", content: widgetBody));
  }

  handleUpdate(
      {required int inputId,
      required String inputTitle,
      required String inputText}) async {
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
      var response = await request.updateNote(
          id: inputId, title: inputTitle, text: inputText);

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

  Widget createTitleTemplate(controller) {
    return TextFormField(
        controller: controller,
        decoration: const InputDecoration(hintText: "Title"));
  }

  Widget createTextTemplate(controller) {
    return TextFormField(controller: controller);
  }

  Widget saveButtonTemplate(newId, titleControl, textControl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: ElevatedButton(
            onPressed: () {
              handleUpdate(
                  inputId: newId,
                  inputTitle: titleControl.text,
                  inputText: textControl.text);
            },
            child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Update",
                  style: TextStyle(fontSize: 20),
                )),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ViewEditArguments;
    final titleInputController = TextEditingController(text: args.title);
    final textInputController = TextEditingController(text: args.text);

    return Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            createTitleTemplate(titleInputController),
            createTextTemplate(textInputController),
            saveButtonTemplate(
                args.id, titleInputController, textInputController)
          ],
        ));
  }
}
