import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:dreadscout/ui/scouting/scoutingpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'DreadScout';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return MaterialApp(
        title: _title,
        theme: ThemeData(appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        )),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: const FormPage(),
        ));
  }
}
