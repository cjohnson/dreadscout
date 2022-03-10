import 'dart:convert';

import 'package:dreadscout/ui/scouting/scoutingform.dart';
import 'package:flutter/material.dart';

import '../form/data/scoutingtemplate.dart';

class TrackPage extends StatelessWidget {
  final String trackTitle;
  final List<ScoutingFormUI> forms;

  TrackPage({required this.trackTitle, required this.forms, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller =
    PageController(initialPage: 0, keepPage: true);

    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: forms,
    );
  }
}
