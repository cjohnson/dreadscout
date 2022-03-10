import 'package:dreadscout/ui/form/data/scoutingtemplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'ui/data/scoutingdata.dart';
import 'ui/scouting/scoutingpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'DreadScout';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    // String rawJson =
    //     "{\"template_id\":\"scouting_form_2022\",\"element\":[{\"id\":\"autonomous_header\",\"title\":\"Autonomous Period\",\"section_header\":{}},{\"id\":\"autonomous_taxi\",\"title\":\"Taxi\",\"switch_form_element\":{\"initial_value\":false}},{\"id\":\"autonomous_low_goal\",\"title\":\"Low Goal\",\"counter_form_element\":{\"initial_value\":0,\"lower_bound\":0}},{\"id\":\"autonomous_high_goal\",\"title\":\"High Goal\",\"counter_form_element\":{\"initial_value\":0,\"lower_bound\":0}},{\"id\":\"teleoperated_header\",\"title\":\"Teleoperated Period\",\"section_header\":{}},{\"id\":\"postgame_header\",\"title\":\"Post-Game Period\",\"section_header\":{}},{\"id\":\"postgame_effective_defense\",\"title\":\"Effective Defense?\",\"switch_form_element\":{\"initial_value\":false}},{\"id\":\"postgame_climb_level\",\"title\":\"Climb Level\",\"toggle_button_form_element\":{\"initial_index\":\"0\",\"toggles\":[\"NONE\",\"LOW\",\"MED\",\"HIGH\",\"TRAV\"]}},{\"id\":\"postgame_comments_box\",\"title\":\"Comments\",\"text_field_element\":{\"initialValue\":\"\"}}]}";
    // Map<String, dynamic> json = jsonDecode(rawJson);
    // print(rawJson);

    // var formTemplate = ScoutingForm.fromJson(json);
    // for (int i = 0; i < formTemplate.elements!.length; i++) {
    //   var formId = formTemplate.templateId;
    //   var elementId = formTemplate.elements![i].id;
    //   print('$formId:$elementId');
    // }

    return MaterialApp(
      title: _title,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: FormPage("belleville"),
      ),
    );
  }
}
