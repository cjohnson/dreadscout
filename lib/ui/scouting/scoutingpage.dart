import 'dart:convert';

import 'package:dreadscout/ui/scouting/scoutingform.dart';
import 'package:flutter/material.dart';

import '../form/data/scoutingtemplate.dart';

class FormPage extends StatefulWidget {
  final String trackTitle;

  const FormPage(this.trackTitle, {Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState(trackTitle);
}

class _FormPageState extends State<FormPage> {
  final String trackTitle;

  final int size = 8;

  List<ScoutingFormUI> forms = <ScoutingFormUI>[];

  _FormPageState(this.trackTitle);

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(initialPage: 0, keepPage: true);

    var json =
        "{\"form_id\":\"belleville:1\",\"team_number\":-1,\"element\":[{\"counter_form_element\":{\"id\":\"autonomous_low_goal\",\"title\":\"Low Goal\",\"value\":0,\"lower_bound\":0}},{\"counter_form_element\":{\"id\":\"autonomous_high_goal\",\"title\":\"High Goal\",\"value\":0,\"lower_bound\":0}},{\"switch_form_element\":{\"id\":\"autonomous_taxi\",\"title\":\"Taxi\",\"initial_value\":false}},{\"counter_form_element\":{\"id\":\"teleoperated_low_goal\",\"title\":\"Low Goal\",\"value\":0,\"lower_bound\":0}},{\"counter_form_element\":{\"id\":\"teleoperated_high_goal\",\"title\":\"High Goal\",\"value\":0,\"lower_bound\":0}},{\"toggle_button_form_element\":{\"id\":\"endgame_climb\",\"title\":\"Climb Level\",\"toggles\":[\"NONE\",\"LOW\",\"MED\",\"HIGH\",\"TRAV\"],\"initial_index\":0}}]}";
    var decode = jsonDecode(json);
    var scoutingForm = ScoutingForm.fromJson(decode);

    for (int i = 1; i <= 8; i++) {
      forms.add(ScoutingFormUI(
        data: scoutingForm,
      ));
    }

    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: forms,
    );
  }
}

class ScoutingTrackController {
  int size;

  ScoutingTrackController(this.size);

  int getSize() {
    return size;
  }
}
