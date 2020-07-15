import 'package:flutter/material.dart';

import 'package:dreadscout/form/element/input_form_element.dart';

/// Custom [SwitchFormElement] widget for simple switch options in a widget
///
/// This form element collects a "Enabled/Disabled" datum.
/// Use for specific input configuration.
class SwitchFormElement extends InputFormElement {
  /// Default Optional Arguments Constructor for [SwitchFormElement].
  SwitchFormElement({Key key, String formElementTitle})
      : super(key: key, formElementTitle: formElementTitle);

  /// Default Overridden [createState] Flutter method.
  @override
  _SwitchFormElementState createState() => _SwitchFormElementState();
}

/// Custom [_SwitchFormElementState] state class for [SwitchFormElement]
///
/// Represents a current state of [SwitchFormElement]
class _SwitchFormElementState extends State<SwitchFormElement> {
  /// Current state of the switch.
  bool switchValue = false;

  /// Click event for the switch [_changeSwitch].
  ///
  /// Changes the state of the datum based on the switch state.
  void _changeSwitch(bool value) {
    setState(() {
      // Set data to new switch status.
      switchValue = value;
    });
  }

  /// Standard overridden [build] method from Flutter.
  @override
  Widget build(BuildContext context) {
    return widget.buildInputFormElement(
      Switch(
        value: switchValue,
        onChanged: _changeSwitch,
      )
    );
  }
}