import 'package:dreadscout/ui/scouting/scoutingform.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  final String trackTitle;

  const FormPage(this.trackTitle, {Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState(trackTitle);
}

class _FormPageState extends State<FormPage> {
  final String trackTitle;

  final int size = 8;

  List<ScoutingForm> forms = <ScoutingForm>[];

  _FormPageState(this.trackTitle);

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(initialPage: 0, keepPage: true);

    for (int i = 0; i <= 8; i++) {
      forms.add(ScoutingForm(
        formName: '$trackTitle:$i',
        teamNumber: -1,
      ));
    }

    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: forms,
      onPageChanged: (int page) {
        forms[page].saveData();
      },
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
