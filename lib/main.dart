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

  Future<ScoutingFormUI> getTemplate() async {
    return ScoutingFormUI(
      data: ScoutingForm.fromJson(await loadJson()),
    );
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
        body: FutureBuilder<ScoutingFormUI?>(
          future: getTemplate(),
          builder: (BuildContext context, AsyncSnapshot<ScoutingFormUI?> snapshot) {
            TrackPage trackPage;
            if(snapshot.hasData) {
              trackPage = TrackPage(trackTitle: "Milford", trackSize: 80, template: snapshot.data!);
            } else {
              trackPage = TrackPage(trackTitle: "ERROR", trackSize: 0, template: ScoutingFormUI(data: ScoutingForm()),);
            }
            return trackPage;
          },
        ),
      ),
    );
  }
}
