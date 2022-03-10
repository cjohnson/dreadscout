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

    for (int i = 1; i <= 8; i++) {
      forms.add(ScoutingFormUI(
        data: ScoutingForm(
            formId: '$trackTitle:$i',
            teamNumber: -1,
            elements: <ScoutingFormElement>[
              ScoutingFormElement(
                formElement:
                    CounterFormElement(id: "low_goal", title: "Low Goal"),
              ),
              ScoutingFormElement(
                formElement:
                    SwitchFormElement(id: "taxi", title: "Taxi", value: false),
              ),
              ScoutingFormElement(
                formElement: ToggleButtonFormElement(
                    id: "climb",
                    title: "Climb Level",
                    index: 0,
                    toggles: [
                      'NONE',
                      'LOW',
                      'MED',
                      'HIGH',
                      'TRAV',
                    ]),
              ),
            ]),
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
