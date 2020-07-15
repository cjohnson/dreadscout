import 'package:flutter/material.dart';

import 'package:dreadscout/form/element/input_form_element.dart';

/// Custom [SwitchFormElement] widget for simple switch options in a widget
///
/// This form element collects a "Enabled/Disabled" datum.
/// Use for specific input configuration.
// ignore: must_be_immutable
class SwitchFormElement extends InputFormElement {
  /// [switchValue] represents the current state of the datum.
  bool switchValue;

  /// Default Optional Arguments Constructor for [SwitchFormElement].
  SwitchFormElement({Key key, String formElementTitle, this.switchValue: false})
      : super(key: key, formElementTitle: formElementTitle);

  /// Default Overridden [createState] Flutter method.
  @override
  _SwitchFormElementState createState() => _SwitchFormElementState();
}

/// Custom [_SwitchFormElementState] state class for [SwitchFormElement]
///
/// Represents a current state of [SwitchFormElement]
class _SwitchFormElementState extends State<SwitchFormElement> {
  /// Click event for the switch [_changeSwitch].
  ///
  /// Changes the state of the datum based on the switch state.
  void _changeSwitch(bool value) {
    setState(() {
      // Set data to new switch status.
      widget.switchValue = value;
    });
  }

  /// Standard overridden [build] method from Flutter.
  @override
  Widget build(BuildContext context) {
    return widget.buildInputFormElement(
      Switch(
        value: widget.switchValue,
        onChanged: _changeSwitch,
      )
    );
  }
}