import 'package:dreadscout/ui/custom/form/element/form_element.dart';
import 'package:dreadscout/ui/custom/form/scouting_form.dart';
import 'package:dreadscout/utility/namespaced_key.dart';
import 'package:flutter/material.dart';

class FormDisplay extends StatelessWidget {
  ScoutingForm form;

  FormDisplay(String formNamespace, String formName, ScoutingForm template) {
    this.form = ScoutingForm(NamespacedKey(formNamespace, formName));
    for (NamespacedKey key in template.formValues.keys)
      this.form.formValues[key] = template.formValues[key];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <FormElement>[
          for (NamespacedKey key in form.formValues.keys) form.formValues[key],
        ]);
  }
}
