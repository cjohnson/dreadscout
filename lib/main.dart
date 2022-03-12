import 'package:dreadscout/model/formelement/counter.dart';
import 'package:dreadscout/model/formelement/sectionheader.dart';
import 'package:dreadscout/model/formelement/textfield.dart';
import 'package:dreadscout/model/formelement/togglebuttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'model/formelement/switch.dart';
import 'model/scoutingform.dart';
import 'ui/scouting/scoutingpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'DreadScout';

  Future<Map<String, dynamic>> loadJson() async {
    var rawJson = await rootBundle.loadString('asset/data/template.json');
    var decode = jsonDecode(rawJson);
    return decode;
  }

  Future<ScoutingForm> getTemplate() async {
    return ScoutingForm.fromJson(await loadJson());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return MaterialApp(
      title: _title,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder<ScoutingForm?>(
          future: getTemplate(),
          builder: (BuildContext context, AsyncSnapshot<ScoutingForm?> snapshot) {
            TrackPage trackPage;
            if(snapshot.hasData) {
              trackPage = TrackPage(trackTitle: "Milford", trackSize: 80, template: snapshot.data!);
            } else {
              trackPage = TrackPage(trackTitle: "ERROR", trackSize: 0, template: ScoutingForm(),);
            }
            return trackPage;
          },
        ),
      ),
    );
  }
}
