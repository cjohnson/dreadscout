import 'dart:convert';

import 'package:dreadscout/ui/data/scoutingdata.dart';
import 'package:dreadscout/ui/scouting/scoutingform.dart';
import 'package:flutter/material.dart';

import '../form/data/scoutingtemplate.dart';

class TrackPage extends StatefulWidget {
  final String trackTitle;
  final ScoutingFormUI template;
  final int trackSize;

  late List<ScoutingFormUI> forms;

  TrackPage({required this.trackTitle, required this.trackSize, required this.template, Key? key}) : super(key: key) {
    forms = <ScoutingFormUI>[
      for(int i = 0; i < trackSize; i++)
        template
    ];
    // if(forms.isEmpty) return;

    for(int i = 0; i < trackSize; i++) {
      forms[i] = ScoutingFormUI(data: ScoutingForm(formId: '$trackTitle Qual $i', elements: List.from(template.data.elements!.toList() as List<ScoutingFormElement>), teamNumber: -1));
    }
  }

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0, keepPage: true);

    for(ScoutingFormUI ui in widget.forms) {
      print(ui.data.formId);
      print(widget.forms.length);
    }

    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: widget.forms,
    );
  }
}
