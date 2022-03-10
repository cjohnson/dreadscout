import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
