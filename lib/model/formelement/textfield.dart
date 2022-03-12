import 'package:flutter/material.dart';

import '../../ui/form/textfieldui.dart';
import '../formelement.dart';

class TextFieldFormElement extends ScoutingFormElement {
  String? text;
  String? hintText;

  TextFieldFormElement({required id, required title, this.text = '', this.hintText = ''}) : super(id: id, title: title, type: 'text_field');

  TextFieldFormElement.clone(TextFieldFormElement source) {
    id = source.id;
    title = source.title;

    text = source.text;
    hintText = source.hintText;
  }

  @override
  Widget wrap() => TextFieldFormElementUI(formElement: this);

  TextFieldFormElement.fromJson(Map<String, dynamic> json) {
    json = super.fromJson(json);

    text = json['text'];
    hintText = json['hint_text'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();

    data['text'] = text;
    data['hint_text'] = hintText;
    return data;
  }
}