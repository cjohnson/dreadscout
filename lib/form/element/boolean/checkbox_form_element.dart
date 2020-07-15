/*
The MIT License (MIT)

Copyright (c) 2020 Collin Johnson/FRC Team 3656

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
 */

import 'package:flutter/material.dart';

import 'package:dreadscout/form/element/input_form_element.dart';

/// Custom [CheckboxFormElement] widget for simple checkbox options in a Widget.
///
/// This form element collects a "Yes/No" or "True/False" datum.
/// Example: Robot Broke? CHECKBOX: Yes/No.
// ignore: must_be_immutable
class CheckboxFormElement extends InputFormElement {
  /// [checkboxValue] represents current state of the datum.
  bool checkboxValue;

  /// Default Optional Arguments Constructor for [CheckboxFormElement].
  CheckboxFormElement(
      {Key key, String formElementTitle, this.checkboxValue: false})
      : super(key: key, formElementTitle: formElementTitle);

  /// Default Overridden [createState] Flutter method.
  @override
  _CheckboxFormElementState createState() => _CheckboxFormElementState();
}

/// Custom [_CheckboxFormElementState] state class for [CheckboxFormElement]
///
/// Represents a current state of [CheckboxFormElement]
class _CheckboxFormElementState extends State<CheckboxFormElement> {
  /// Click event for the checkbox [_changeCheck].
  ///
  /// Changes the state of the datum based on the checkbox state.
  void _changeCheck(bool value) {
    setState(() {
      // Set data to new checkbox status.
      widget.checkboxValue = value;
    });
  }

  /// Standard overridden [build] method from Flutter.
  @override
  Widget build(BuildContext context) {
    return widget.buildInputFormElement(Checkbox(
      value: widget.checkboxValue,
      onChanged: _changeCheck,
    ));
  }
}
