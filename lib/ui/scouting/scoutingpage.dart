import 'package:flutter/material.dart';

import 'package:dreadscout/ui/scouting/scoutingform.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  List<Widget> forms = <Widget>[
    ScoutingForm(pageNumber: 1),
    ScoutingForm(pageNumber: 2),
    ScoutingForm(pageNumber: 3),
  ];

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: forms,
    );
  }
}
