import 'package:flutter/material.dart';

import 'package:dreadscout/form/element/input_form_element.dart';

/// Custom [RadioOptionFormElement] Widget for Multiple Choice Style Options.
///
/// This form element collects a multiple choice style option.
/// Example: Robot Hab Level: 1st, 2nd, 3rd
// ignore: must_be_immutable
class RadioOptionFormElement extends InputFormElement {
  /// [numberOfRadioOptions] represents the number of possible radio options.
  final int numberOfRadioOptions;

  /// [radioValue] represents current selected radio element.
  int radioValue;

  /// Default Optional Arguments Constructor for [RadioOptionFormElement].
  RadioOptionFormElement(this.numberOfRadioOptions,
                        {Key key,
                         String formElementTitle,
                         this.radioValue = 0})
      : super(key: key, formElementTitle: formElementTitle);

  @override
  _RadioOptionFormElementState createState() => _RadioOptionFormElementState();
}

/// Custom [_RadioOptionFormElementState] state class
///
/// Represents a current state of [RadioOptionFormElement]
class _RadioOptionFormElementState extends State<RadioOptionFormElement> {
  /// Click event for the radio option [_handleRadioValueChanged]
  ///
  /// Changes the state of teh datum based on the checkbox state.
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
          for(int index = 0; index < widget.numberOfRadioOptions; ++index)
            Column(
              children: [
                Text(
                  '$index'
                ),
                Radio<int>(
                  value: index,
                  groupValue: widget.radioValue,
                  onChanged: _handleRadioValueChanged,
                )
              ],
            ),
        ],
      ),
    );
  }
}