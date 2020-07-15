import 'package:dreadscout/form/element/boolean/switch_form_element.dart';
import 'package:flutter/material.dart';

import 'file:///C:/Workspace/dreadscout/lib/form/element/boolean/checkbox_form_element.dart';

/// Dreadscout Home Page [DreadScoutHomePage]
/// 
/// This is the Home Page of the Dreadscout Application.
/// This acts as a gateway to multiple different subpages.
class DreadScoutHomePage extends StatefulWidget {
  DreadScoutHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DreadScoutHomePageState createState() => _DreadScoutHomePageState();
}

/// State class for DreadScout Home Page object [_DreadScoutHomePageState]
///
/// This acts as a state for when the Stateful object [DreadScoutHomePage] changes.
class _DreadScoutHomePageState extends State<DreadScoutHomePage> {

  /// Standard [build] method, overrides Flutter build.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Standard AppBar instance with Application Title.
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // Contents are contained within Center & Column Objects
      // TODO Reorganize Home Page
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Sample Dreadscout Widgets for Scouting Collection Data.
            CheckboxFormElement(formElementTitle: 'Robot Broke?',),
            SwitchFormElement(formElementTitle: 'Robot participated in water game?',)
          ],
        ),
      ),
    );
  }
}