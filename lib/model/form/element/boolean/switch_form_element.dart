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

import 'package:dreadscout/model/form/element/input_form_element.dart';

/// Custom [SwitchFormElement] widget for simple switch options in a widget
///
/// This form element collects a "Enabled/Disabled" datum.
/// Use for specific input configuration.
class SwitchFormElement extends InputFormElement {
  /// [switchValue] represents the current state of the datum.
  bool switchValue;

  /// Default Optional Arguments Constructor for [SwitchFormElement].
  SwitchFormElement({Key key, String formElementTitle, this.switchValue: false})
      : super(key: key, formElementTitle: formElementTitle);

  /// Default Overridden [createState] Flutter method.
  @override
  _SwitchFormElementState createState() => _SwitchFormElementState();

  @override
  bool getElementData() => switchValue;
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
    return widget.buildInputFormElement(Switch(
      value: widget.switchValue,
      onChanged: _changeSwitch,
    ));
  }
}
