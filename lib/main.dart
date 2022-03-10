import 'package:dreadscout/ui/form/data/scoutingtemplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'ui/scouting/scoutingform.dart';
import 'ui/scouting/scoutingpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'DreadScout';

  Future<Map<String, dynamic>> loadJson() async {
    var rawJson = await rootBundle.loadString('asset/data/form_template.json');
    var decode = jsonDecode(rawJson);
    return decode;
  }

  Future<List<ScoutingFormUI>?> getTemplate() async {
    var scoutingForm = ScoutingForm.fromJson(await loadJson());

    List<ScoutingFormUI>? forms = <ScoutingFormUI>[
      for (int i = 1; i <= 8; i++)
        ScoutingFormUI(
          data: scoutingForm,
        ),
    ];

    return forms;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    var forms = getTemplate();

    return MaterialApp(
      title: _title,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder<List<ScoutingFormUI>?>(
          future: getTemplate(),
          builder: (BuildContext context, AsyncSnapshot<List<ScoutingFormUI>?> snapshot) {
            TrackPage trackPage;
            if(snapshot.hasData) {
              trackPage = TrackPage(trackTitle: "trackTitle", forms: snapshot.data!);
            } else {
              trackPage = TrackPage(trackTitle: "ERROR", forms: const [],);
            }
            return trackPage;
          },
        ),
      ),
    );
  }
}
