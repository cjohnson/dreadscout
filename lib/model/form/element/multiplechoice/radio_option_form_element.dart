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

/// Custom [RadioOptionFormElement] Widget for Multiple Choice Style Options.
///
/// This form element collects a multiple choice style option.
/// Example: Robot Hab Level: 1st, 2nd, 3rd
class RadioOptionFormElement extends InputFormElement {
  /// [choiceTitles] is the list of options in the multiple choice list.
  List<String> choiceTitles;

  /// [radioValue] represents current selected radio element.
  int radioValue;

  /// Default Optional Arguments Constructor for [RadioOptionFormElement].
  RadioOptionFormElement(this.choiceTitles,
      {Key key, String formElementTitle, this.radioValue = 0})
      : super(key: key, formElementTitle: formElementTitle);

  @override
  _RadioOptionFormElementState createState() => _RadioOptionFormElementState();

  @override
  Set<Object> getElementData() => {radioValue, choiceTitles[radioValue]};
}

/// Custom [_RadioOptionFormElementState] state class
///
/// Represents a current state of [RadioOptionFormElement]
class _RadioOptionFormElementState extends State<RadioOptionFormElement> {
  /// Click event for the radio option [_handleRadioValueChanged]
  ///
  /// Changes the state of the datum based on the checkbox state.
  void _handleRadioValueChanged(int value) {
    setState(() {
      widget.radioValue = value;
    });
  }

  /// Standard overridden [build] method from Flutter.
  @override
  Widget build(BuildContext context) {
    return widget.buildInputFormElement(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int index = 0; index < widget.choiceTitles.length; ++index)
            TitledRadioWidget(
                title: '${widget.choiceTitles[index]}',
                radioValue: index,
                radioGroupValue: widget.radioValue,
                onRadioChange: _handleRadioValueChanged),
        ],
      ),
    );
  }
}

/// Custom [TitledRadioWidget] widget to represent a titled radio option.
class TitledRadioWidget extends StatefulWidget {
  /// The [title] of the Radio Option.
  String title;

  /// The Value (or index) of the option.
  int radioValue;

  /// The current selected radio in the group of radio buttons.
  int radioGroupValue;

  /// [onRadioChange] executes when radio is selected.
  Function(int) onRadioChange;

  /// [TitledRadioWidget] Optional/Required args constructor.
  TitledRadioWidget(
      {this.title: 'Option', @required this.radioValue, @required this.radioGroupValue, @required this.onRadioChange});

  /// Default overridden [createState] method from Flutter.
  @override
  _TitledRadioWidgetState createState() => _TitledRadioWidgetState();
}

/// State class for [TitledRadioWidget] class.
class _TitledRadioWidgetState extends State<TitledRadioWidget> {
  /// Default overriden [build] method from Flutter.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('${widget.title}'),
          Radio<int>(
            value: widget.radioValue,
            groupValue: widget.radioGroupValue,
            onChanged: widget.onRadioChange,
          ),
        ]
      )
    );
  }
}
