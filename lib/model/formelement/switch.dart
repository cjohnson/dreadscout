import 'package:flutter/material.dart';

import '../../ui/form/switchui.dart';
import '../formelement.dart';

class SwitchFormElement extends ScoutingFormElement {
  bool? value;

  SwitchFormElement({id, title, this.value = false}) : super(id: id, title: title, type: 'switch');

  SwitchFormElement.clone(SwitchFormElement source) {
    id = source.id;
    title = source.title;

    value = source.value;
  }

  @override
  Widget wrap() => SwitchFormElementUI(formElement: this);

  SwitchFormElement.fromJson(Map<String, dynamic> json) {
    json = super.fromJson(json);

    value = json['value'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();

    data['value'] = value;
    return data;
  }
}