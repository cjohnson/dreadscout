import 'package:flutter/material.dart';

import '../ui/scouting/scoutingform.dart';
import 'formelement.dart';
import 'formelement/counter.dart';
import 'formelement/sectionheader.dart';
import 'formelement/switch.dart';
import 'formelement/textfield.dart';
import 'formelement/togglebuttons.dart';

class ScoutingForm {
  String? formId;
  int? teamNumber;
  List<ScoutingFormElement>? elements;

  ScoutingForm({this.formId, this.teamNumber, this.elements});

  ScoutingForm.fromJson(Map<String, dynamic> json) {
    formId = json['form_id'];
    teamNumber = json['team_number'];
    if (json['elements'] != null) {
      elements = <ScoutingFormElement>[];
      ScoutingFormElement? formElement;
      json['elements'].forEach((v) {
        formElement = mapTypeJsonToDartType(formElement, v);
        elements!.add(formElement!);
      });
    }
  }

  ScoutingForm.fromTemplate(ScoutingForm template, {required this.formId, this.teamNumber = -1}) {
    elements = <ScoutingFormElement>[];
    for(ScoutingFormElement element in template.elements!) {
      if(element is CounterFormElement) {
        elements!.add(CounterFormElement.clone(element));
        continue;
      }

      if(element is SectionHeaderFormElement) {
        elements!.add(SectionHeaderFormElement.clone(element));
        continue;
      }

      if(element is SwitchFormElement) {
        elements!.add(SwitchFormElement.clone(element));
        continue;
      }

      if(element is TextFieldFormElement) {
        elements!.add(TextFieldFormElement.clone(element));
        continue;
      }

      if(element is ToggleButtonFormElement) {
        elements!.add(ToggleButtonFormElement.clone(element));
        continue;
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['form_id'] = formId;
    data['team_number'] = teamNumber;
    if (elements != null) {
      data['elements'] = elements!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  ScoutingFormUI wrap() {
    return ScoutingFormUI(data: this,);
  }

  ScoutingFormElement? mapTypeJsonToDartType(ScoutingFormElement? formElement, v) {
    formElement = v['type'] == 'section_header'
        ? SectionHeaderFormElement.fromJson(v)
        : null;
    if(formElement != null) return formElement;

    formElement = v['type'] == 'switch'
        ? SwitchFormElement.fromJson(v)
        : null;
    if(formElement != null) return formElement;

    formElement = v['type'] == 'counter'
        ? CounterFormElement.fromJson(v)
        : null;
    if(formElement != null) return formElement;

    formElement = v['type'] == 'toggle_buttons'
        ? ToggleButtonFormElement.fromJson(v)
        : null;
    if(formElement != null) return formElement;

    formElement = v['type'] == 'text_field'
        ? TextFieldFormElement.fromJson(v)
        : null;
    if(formElement != null) return formElement;

    return formElement;
  }
}