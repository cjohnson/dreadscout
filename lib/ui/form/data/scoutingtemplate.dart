import 'package:flutter/material.dart';

import '../counterformelement.dart';
import '../switchformelement.dart';
import '../togglebuttonelement.dart';

class ScoutingForm {
  String? formId;
  int? teamNumber;
  List<ScoutingFormElement>? elements;

  ScoutingForm({this.formId, this.teamNumber, this.elements});

  ScoutingForm.fromJson(Map<String, dynamic> json) {
    formId = json['form_id'];
    teamNumber = json['team_number'];
    if (json['element'] != null) {
      elements = <ScoutingFormElement>[];
      json['element'].forEach((v) {
        elements!.add(ScoutingFormElement.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['form_id'] = formId;
    data['team_number'] = teamNumber;
    if (elements != null) {
      data['element'] = elements!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ScoutingFormElement {
  FormElementData? formElement;

  ScoutingFormElement({this.formElement});

  ScoutingFormElement.fromJson(Map<String, dynamic> json) {
    formElement = json['section_header'] != null
        ? SectionHeader.fromJson(json['section_header'])
        : null;
    formElement = json['switch_form_element'] != null
        ? SwitchFormElement.fromJson(json['switch_form_element'])
        : null;
    formElement = json['counter_form_element'] != null
        ? CounterFormElement.fromJson(json['counter_form_element'])
        : null;
    formElement = json['toggle_button_form_element'] != null
        ? ToggleButtonFormElement.fromJson(json['toggle_button_form_element'])
        : null;
    formElement = json['text_field_element'] != null
        ? TextFieldElement.fromJson(json['text_field_element'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (formElement is SectionHeader) {
      data['section_header'] = formElement!.toJson();
    }
    if (formElement is SwitchFormElement) {
      data['switch_form_element'] = formElement!.toJson();
    }
    if (formElement is CounterFormElement) {
      data['counter_form_element'] = formElement!.toJson();
    }
    if (formElement is ToggleButtonFormElement) {
      data['toggle_button_form_element'] = formElement!.toJson();
    }
    if (formElement is TextFieldElement) {
      data['text_field_element'] = formElement!.toJson();
    }
    return data;
  }
}

abstract class FormElementData {
  String? id;
  String? title;

  FormElementData({this.id, this.title});

  Map<String, dynamic> fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];

    return json;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;

    return data;
  }

  Widget wrapInUI();
}

class SectionHeader extends FormElementData {
  SectionHeader.fromJson(Map<String, dynamic> json) {
    json = super.fromJson(json);
  }

  @override
  Widget wrapInUI() {
    // TODO: implement wrapInUI
    throw UnimplementedError();
  }
}

class SwitchFormElement extends FormElementData {
  bool? _value;

  SwitchFormElement({id, title, value}) : super(id: id, title: title) {
    _value = value;
  }

  SwitchFormElement.fromJson(Map<String, dynamic> json) {
    json = super.fromJson(json);

    value = json['initial_value'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();

    data['initial_value'] = value;
    return data;
  }

  bool? get value => _value;

  set value(bool? newValue) {
    _value = newValue!;
  }

  @override
  Widget wrapInUI() {
    return SwitchFormElementUI(formElement: this);
  }
}

class CounterFormElement extends FormElementData {
  int? _value;
  int? lowerBound;

  CounterFormElement(
      {required id, required title, value = 0, this.lowerBound = 0})
      : super(id: id, title: title) {
    _value = value;
  }

  CounterFormElement.fromJson(Map<String, dynamic> json) {
    json = super.fromJson(json);

    value = json['value'];
    lowerBound = json['lower_bound'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();

    data['initial_value'] = value;
    data['lower_bound'] = lowerBound;
    return data;
  }

  int? get value => _value;

  set value(int? newValue) {
    if (newValue! < lowerBound!) newValue = lowerBound;

    _value = newValue!;
  }

  void increment() {
    value = value! + 1;
  }

  void decrement() {
    if (value! == lowerBound!) return;
    value = value! - 1;
  }

  @override
  Widget wrapInUI() {
    return CounterFormElementUI(formElement: this);
  }
}

class ToggleButtonFormElement extends FormElementData {
  int? _index;
  List<String>? toggles;

  ToggleButtonFormElement({required id, required title, index, this.toggles})
      : super(id: id, title: title) {
    _index = index;
  }

  ToggleButtonFormElement.fromJson(Map<String, dynamic> json) {
    json = super.fromJson(json);

    index = int.tryParse(json['initial_index']);
    toggles = json['toggles'].cast<String>();
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();

    data['initial_index'] = index;
    data['toggles'] = toggles;
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

  @override
  Widget wrapInUI() {
    return ToggleButtonFormElementUI(formElement: this);
  }
}

class TextFieldElement extends FormElementData {
  String? initialValue;

  TextFieldElement({this.initialValue});

  TextFieldElement.fromJson(Map<String, dynamic> json) {
    initialValue = json['initialValue'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['initialValue'] = initialValue;
    return data;
  }

  @override
  Widget wrapInUI() {
    // TODO: implement wrapInUI
    throw UnimplementedError();
  }
}
