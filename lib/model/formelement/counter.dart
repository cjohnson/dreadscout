import 'package:flutter/src/widgets/framework.dart';

import '../../ui/form/counterui.dart';
import '../formelement.dart';

class CounterFormElement extends ScoutingFormElement {
  int? _value;
  int? lowerBound;

  CounterFormElement(
      {required id, required title, value = 0, this.lowerBound = 0})
      : super(id: id, title: title, type: 'counter') {
    _value = value;
  }

  void increment() => value = value! + 1;

  void decrement() {
    if (value! == lowerBound!) return;
    value = value! - 1;
  }

  @override
  Widget wrap() => CounterFormElementUI(formElement: this);

  CounterFormElement.fromJson(Map<String, dynamic> json) {
    json = super.fromJson(json);

    lowerBound = json['lower_bound'];
    value = json['value'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();

    data['value'] = value;
    data['lower_bound'] = lowerBound;
    return data;
  }

  int? get value => _value;

  set value(int? newValue) {
    if (newValue! < lowerBound!) newValue = lowerBound;

    _value = newValue!;
  }
}