class ScoutingForm {
  String? templateId;
  List<ScoutingFormElement>? elements;

  ScoutingForm({this.templateId, this.elements});

  ScoutingForm.fromJson(Map<String, dynamic> json) {
    templateId = json['template_id'];
    if (json['element'] != null) {
      elements = <ScoutingFormElement>[];
      json['element'].forEach((v) {
        elements!.add(ScoutingFormElement.fromJson(v));
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

class ScoutingFormElement {
  String? id;
  String? title;
  FormElementData? formElement;

  ScoutingFormElement({this.id, this.title, this.formElement});

  ScoutingFormElement.fromJson(Map<String, dynamic> json) {
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
}

class SectionHeader extends FormElementData {
  SectionHeader.fromJson(Map<String, dynamic> json) {
    json = super.fromJson(json);
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
}

class CounterFormElement extends FormElementData {
  int? _value;
  int? lowerBound;

  CounterFormElement({id, title, value, this.lowerBound = 0})
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
}

class ToggleButtonFormElement extends FormElementData {
  int? initialIndex;
  List<String>? toggles;

  ToggleButtonFormElement({this.initialIndex, this.toggles});

  ToggleButtonFormElement.fromJson(Map<String, dynamic> json) {
    json = super.fromJson(json);

    initialIndex = int.tryParse(json['initial_index']);
    toggles = json['toggles'].cast<String>();
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();

    data['initial_index'] = initialIndex;
    data['toggles'] = toggles;
    return data;
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
}
