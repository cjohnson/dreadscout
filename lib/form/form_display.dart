import 'package:flutter/material.dart';

import 'package:dreadscout/form/element/form_element.dart';
import 'package:dreadscout/utility/namespaced_key.dart';

import 'element/boolean/checkbox_form_element.dart';
import 'element/boolean/switch_form_element.dart';
import 'element/button/submit_form_button.dart';
import 'element/multiplechoice/choice_chip_option_form_element.dart';
import 'element/multiplechoice/radio_option_form_element.dart';
import 'element/numeric/counter_form_element.dart';
import 'element/section/section_header.dart';
import 'scouting_form.dart';

class FormDisplay extends StatelessWidget {
  ScoutingForm form;

  FormDisplay(String formNamespace, String formName, ScoutingForm template) {
    this.form = ScoutingForm(NamespacedKey(formNamespace, formName));
    for(NamespacedKey key in template.formValues.keys)
      this.form.formValues[key] = template.formValues[key];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <FormElement>[
          for (NamespacedKey key in form.formValues.keys) form.formValues[key],
        ]
//        SectionHeader(title: 'Autonomous Period'),
//        RadioOptionFormElement(
//          <String>[
//            "One",
//            "Two",
//            "Three"
//          ],
//          formElementTitle: 'Hab Level',
//        ),
//        ChoiceChipOptionFormElement(
//          <String>[
//            "One",
//            "Two",
//            "Three"
//          ],
//          formElementTitle: 'Hab Level',
//        ),
//        CheckboxFormElement(
//          formElementTitle: 'Robot Broke?',
//        ),
//        SwitchFormElement(
//          formElementTitle: 'Robot participated in water game?',
//        ),
//        CounterFormElement(
//          formElementTitle: 'Number of Hatch Panels',
//        ),
//        SubmitFormButton(formTitle: 'Qualification Match 30, Scouting frc:team_3656',),
//      ],
        );
  }
}
