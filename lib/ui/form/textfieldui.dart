import 'package:flutter/material.dart';

import '../../model/formelement/textfield.dart';

class TextFieldFormElementUI extends StatelessWidget {
  final TextFieldFormElement formElement;

  const TextFieldFormElementUI({Key? key, required this.formElement})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: formElement.text);

    return Container(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: formElement.hintText
        ),
      ),
    );
  }
}