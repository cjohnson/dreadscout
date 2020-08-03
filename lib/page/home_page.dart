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

import 'package:dreadscout/form/element/section/section_header.dart';
import 'package:dreadscout/form/form_display.dart';
import 'package:dreadscout/form/scouting_form.dart';
import 'package:dreadscout/utility/namespaced_key.dart';
import 'package:flutter/material.dart';

import 'package:dreadscout/form/element/boolean/checkbox_form_element.dart';
import 'package:dreadscout/form/element/boolean/switch_form_element.dart';
import 'package:dreadscout/form/element/multiplechoice/radio_option_form_element.dart';
import 'package:dreadscout/form/element/numeric/counter_form_element.dart';
import 'package:dreadscout/form/element/button/submit_form_button.dart';
import 'package:dreadscout/form/element/multiplechoice/choice_chip_option_form_element.dart';

/// Dreadscout Home Page [DreadScoutHomePage]
///
/// This is the Home Page of the Dreadscout Application.
/// This acts as a gateway to multiple different subpages.
class DreadScoutHomePage extends StatefulWidget {
  DreadScoutHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DreadScoutHomePageState createState() => _DreadScoutHomePageState();
}

/// State class for DreadScout Home Page object [_DreadScoutHomePageState]
///
/// This acts as a state for when the Stateful object [DreadScoutHomePage] changes.
class _DreadScoutHomePageState extends State<DreadScoutHomePage> {
  /// Standard [build] method, overrides Flutter build.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Standard AppBar instance with Application Title.
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // Contents are contained within Center & Column Objects
      // TODO Reorganize Home Page
      body: Center(
        child: DreadScoutFormDemo(),
      ),
    );
  }
}

/// [DreadScoutFormDemo] is a demonstration widget of the features of central dreadscout.
class DreadScoutFormDemo extends StatelessWidget {
  const DreadScoutFormDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScoutingForm demoScoutingForm = ScoutingForm(
      NamespacedKey('scouting_templates', 'test_2021'),
    );

    return FormDisplay(
        '3656_2021_belleville',
        'qualification_36',
        // TODO Remove hardcode example, as templates are designed by users, not developers.
        demoScoutingForm
          ..addScoutingElements({
            NamespacedKey('test_2021', 'autonomous_header'):
                SectionHeader(title: 'Autonomous Period'),
            NamespacedKey('test_2021', 'hab_level_radio'):
                RadioOptionFormElement(
              <String>["One", "Two", "Three"],
              formElementTitle: 'Hab Level',
            ),
            NamespacedKey('test_2021', 'hab_level_choice_chip'):
                ChoiceChipOptionFormElement(
              <String>["One", "Two", "Three"],
              formElementTitle: 'Hab Level',
            ),
            NamespacedKey('test_2021', 'robot_broken'): CheckboxFormElement(
              formElementTitle: 'Robot Broke?',
            ),
            NamespacedKey('test_2021', 'robot_water_game'): SwitchFormElement(
              formElementTitle: 'Robot participated in water game?',
            ),
            NamespacedKey('test_2021', 'number_hatchpanel'): CounterFormElement(
              formElementTitle: 'Number of Hatch Panels',
            ),
            NamespacedKey('test_2021', 'default_submit_button'):
                SubmitFormButton(
              demoScoutingForm,
              formTitle: '3656_2021_belleville:qualification_36, frc:team_3656',
            ),
          }));
  }
}
