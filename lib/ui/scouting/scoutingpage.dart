import 'dart:convert';

import 'package:dreadscout/ui/scouting/scoutingform.dart';
import 'package:flutter/material.dart';

import '../../model/scoutingform.dart';

class TrackPage extends StatelessWidget {
  final String trackTitle;
  final ScoutingForm template;
  final int trackSize;

  late final List<ScoutingFormUI> forms;

  TrackPage({required this.trackTitle, required this.trackSize, required this.template, Key? key}) : super(key: key) {
    forms = <ScoutingFormUI>[
      for(int i = 0; i < trackSize; i++)
        ScoutingFormUI(data: template)
    ];

    for(int i = 0; i < trackSize; i++) {
      forms[i] = ScoutingForm.fromTemplate(template, formId: '$trackTitle Qual ${i + 1}').wrap();
    }
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0, keepPage: true);

    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: forms,
    );
  }
}