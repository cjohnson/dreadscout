/*
The MIT License (MIT)

Copyright (c) 2020 Collin Johnson/FRC Team 3656

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
 */

import 'package:dreadscout/form/element/form_element.dart';
import 'package:dreadscout/utility/namespaced_key.dart';

/// Represents storage of the various forms tracked during the app's runtime.
class ScoutingForm {
  /// [formKey] acts as the unique identifier of the form.
  final NamespacedKey formKey;

  /// [formValues] are the keyed values of each form (data)
  Map<NamespacedKey, FormElement> formValues;

  /// Required [formKey] constructor.
  ScoutingForm(this.formKey) {
    this.formValues = Map<NamespacedKey, FormElement>();
  }

  void submit() {
    print('Submitting $formKey...\nNew Values: $formValues');
  }

  void addScoutingElement(String namespace, String name, FormElement Function() ifAbsent) {
    formValues.putIfAbsent(NamespacedKey(namespace, name), ifAbsent);
  }

  void addScoutingElements(Map<NamespacedKey, FormElement> newFormValues) {
    for(NamespacedKey key in newFormValues.keys)
      formValues[key] = newFormValues[key];
  }

  @override
  String toString() {
    return 'ScoutingForm{formKey: $formKey, formValues: $formValues}';
  }
}