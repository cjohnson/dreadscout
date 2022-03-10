class ScoutingFormTemplate {
  String? templateId;
  List<Element>? elements;

  ScoutingFormTemplate({this.templateId, this.elements});

  ScoutingFormTemplate.fromJson(Map<String, dynamic> json) {
    templateId = json['template_id'];
    if (json['element'] != null) {
      elements = <Element>[];
      json['element'].forEach((v) {
        elements!.add(Element.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['template_id'] = templateId;
    if (elements != null) {
      data['element'] = elements!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Element {
  String? id;
  String? title;
  FormElement? formElement;
  SectionHeader? sectionHeader;
  SwitchFormElement? switchFormElement;
  CounterFormElement? counterFormElement;
  ToggleButtonFormElement? toggleButtonFormElement;
  TextFieldElement? textFieldElement;

  Element(
      {this.id,
      this.title,
      this.sectionHeader,
      this.switchFormElement,
      this.counterFormElement,
      this.toggleButtonFormElement,
      this.textFieldElement});

  Element.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    sectionHeader = json['section_header'] != null
        ? SectionHeader.fromJson(json['section_header'])
        : null;
    switchFormElement = json['switch_form_element'] != null
        ? SwitchFormElement.fromJson(json['switch_form_element'])
        : null;
    counterFormElement = json['counter_form_element'] != null
        ? CounterFormElement.fromJson(json['counter_form_element'])
        : null;
    toggleButtonFormElement = json['toggle_button_form_element'] != null
        ? ToggleButtonFormElement.fromJson(json['toggle_button_form_element'])
        : null;
    textFieldElement = json['text_field_element'] != null
        ? TextFieldElement.fromJson(json['text_field_element'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (sectionHeader != null) {
      data['section_header'] = sectionHeader!.toJson();
    }
    if (switchFormElement != null) {
      data['switch_form_element'] = switchFormElement!.toJson();
    }
    if (counterFormElement != null) {
      data['counter_form_element'] = counterFormElement!.toJson();
    }
    if (toggleButtonFormElement != null) {
      data['toggle_button_form_element'] = toggleButtonFormElement!.toJson();
    }
    if (textFieldElement != null) {
      data['text_field_element'] = textFieldElement!.toJson();
    }
    return data;
  }
}

abstract class FormElement {}

class SectionHeader extends FormElement {
  SectionHeader();

  SectionHeader.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{};
  }
}

class SwitchFormElement extends FormElement {
  bool? initialValue;

  SwitchFormElement({this.initialValue});

  SwitchFormElement.fromJson(Map<String, dynamic> json) {
    initialValue = json['initial_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['initial_value'] = initialValue;
    return data;
  }
}

class CounterFormElement extends FormElement {
  int? initialValue;
  int? lowerBound;

  CounterFormElement({this.initialValue, this.lowerBound});

  CounterFormElement.fromJson(Map<String, dynamic> json) {
    initialValue = json['initial_value'];
    lowerBound = json['lower_bound'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['initial_value'] = initialValue;
    data['lower_bound'] = lowerBound;
    return data;
  }
}

class ToggleButtonFormElement extends FormElement {
  String? initialIndex;
  List<String>? toggles;

  ToggleButtonFormElement({this.initialIndex, this.toggles});

  ToggleButtonFormElement.fromJson(Map<String, dynamic> json) {
    initialIndex = json['initial_index'];
    toggles = json['toggles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['initial_index'] = initialIndex;
    data['toggles'] = toggles;
    return data;
  }
}

class TextFieldElement extends FormElement {
  String? initialValue;

  TextFieldElement({this.initialValue});

  TextFieldElement.fromJson(Map<String, dynamic> json) {
    initialValue = json['initialValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['initialValue'] = initialValue;
    return data;
  }
}
