import 'package:dreadscout/form/element/input_form_element.dart';
import 'package:flutter/material.dart';

/// Custom [CheckboxFormElement] widget for simple checkbox options in a Widget.
///
/// This form element collects a "Yes/No" or "True/False" datum.
/// Example: Robot Broke? CHECKBOX: Yes/No.
// ignore: must_be_immutable
class CheckboxFormElement extends InputFormElement {
  /// Default Optional Arguments Constructor for [CheckboxFormElement].
  CheckboxFormElement({Key key, String formElementTitle})
      : super(key: key, formElementTitle: formElementTitle);

  /// Default Overridden [createState] Flutter method.
  @override
  _CheckboxFormElementState createState() => _CheckboxFormElementState();
}

/// Custom [_CheckboxFormElementState] state class for [CheckboxFormElement]
///
/// Represents a current state of [CheckboxFormElement]
class _CheckboxFormElementState extends State<CheckboxFormElement> {
  /// Current state of the checkbox.
  bool checkboxValue = false;

  /// Click event for the checkbox [_changeCheck].
  ///
  /// Changes the state of the datum based on the checkbox state.
  void _changeCheck(bool value) {
    setState(() {
      // Set data to new checkbox status.
      checkboxValue = value;
    });
  }

  /// Standard overridden [build] method from Flutter.
  @override
  Widget build(BuildContext context) {
    return widget.buildInputFormElement(
      Checkbox(
        value: checkboxValue,
        onChanged: _changeCheck,
      )
    );
  }
}