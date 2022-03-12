import 'package:flutter/material.dart';

import '../../ui/form/togglebuttonsui.dart';
import '../formelement.dart';

class ToggleButtonFormElement extends ScoutingFormElement {
  int? _index;
  List<String>? toggles;

  ToggleButtonFormElement({required id, required title, index = 0, this.toggles})
      : super(id: id, title: title, type: 'toggle_buttons') {
    _index = index;
  }

  @override
  Widget wrap() => ToggleButtonFormElementUI(formElement: this);

  ToggleButtonFormElement.fromJson(Map<String, dynamic> json) {
    json = super.fromJson(json);

    toggles = json['toggles'].cast<String>();
    index = json['initial_index'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();

    data['toggles'] = toggles;
    data['initial_index'] = index;
    return data;
  }

  List<bool> getSelected() {
    final List<bool> buttonStatuses = <bool>[];

    for (int i = 0; i < toggles!.length; i++) {
      buttonStatuses.add(index == i ? true : false);
    }

    return buttonStatuses;
  }

  int? get index => _index;

  set index(int? newIndex) {
    if (newIndex! < 0) newIndex = 0;
    if (newIndex >= toggles!.length) newIndex = toggles!.length - 1;

    _index = newIndex;
  }
}