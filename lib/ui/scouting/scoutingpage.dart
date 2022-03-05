import 'package:dreadscout/ui/scouting/scoutingform.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final ScoutingTrackController scoutingTrackController = ScoutingTrackController(8);

  List<Widget> forms = <Widget>[];

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    for(int i = 0; i <= scoutingTrackController.size; i++) {
      forms.add(ScoutingForm(pageNumber: i,));
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