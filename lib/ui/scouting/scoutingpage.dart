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

  final ScoutingTrackController scoutingTrackController = ScoutingTrackController(8);

  List<Widget> forms = <Widget>[];

  _FormPageState(this.trackTitle);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    for(int i = 0; i <= scoutingTrackController.size; i++) {
      forms.add(ScoutingForm(formName: '$trackTitle:$i',));
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