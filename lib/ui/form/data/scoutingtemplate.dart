class ScoutingFormTemplate {
  String? templateId;
  List<ScoutingFormTemplateElement>? elements;

  ScoutingFormTemplate({this.templateId, this.elements});

  ScoutingFormTemplate.fromJson(Map<String, dynamic> json) {
    templateId = json['template_id'];
    if (json['element'] != null) {
      elements = <ScoutingFormTemplateElement>[];
      json['element'].forEach((v) {
        elements!.add(ScoutingFormTemplateElement.fromJson(v));
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

class ScoutingFormTemplateElement {
  String? id;
  String? title;
  FormElement? formElement;

  ScoutingFormTemplateElement({this.id, this.title, this.formElement});

  ScoutingFormTemplateElement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
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
    data['id'] = id;
    data['title'] = title;
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

abstract class FormElement {
  Map<String, dynamic> toJson() {
    return <String, dynamic>{};
  }
}

class SectionHeader extends FormElement {
  SectionHeader();

  SectionHeader.fromJson(Map<String, dynamic> json);

  @override
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

  @override
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

  @override
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

  @override
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

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['initialValue'] = initialValue;
    return data;
  }
}
