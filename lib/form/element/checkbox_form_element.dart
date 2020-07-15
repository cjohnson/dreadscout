import 'package:flutter/material.dart';

/// Custom [CheckboxFormElement] widget for simple checkbox options in a Widget.
///
/// This form element collects a "Yes/No" or "True/False" datum.
/// Example: Robot Broke? CHECKBOX: Yes/No.
class CheckboxFormElement extends StatefulWidget {
  /// [defaultFormElementTitle] to stand in where no title is given.
  static final String defaultFormElementTitle = 'Checkbox Value?';

  /// [containerSidePadding] is the left and right padding of the object.
  static final double containerSidePadding = 12.0;

  /// [containerTopBottomPadding] is the top and bottom padding of the object.
  static final double containerTopBottomPadding = 8.0;

  /// Title of the element datum.
  ///
  /// Example: "Robot Broke?"
  final String formElementTitle;

  /// Default Optional Arguments Constructor for [CheckboxFormElement]
  CheckboxFormElement({Key key, this.formElementTitle}) : super(key: key);

  /// Default Overriden [createState] Flutter method.
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

  /// Standard overriden [build] method from Flutter.
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: CheckboxFormElement.containerSidePadding,
          right: CheckboxFormElement.containerSidePadding,
          top: CheckboxFormElement.containerTopBottomPadding,
          bottom: CheckboxFormElement.containerTopBottomPadding
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget> [
          Text(widget.formElementTitle??CheckboxFormElement.defaultFormElementTitle),
          Checkbox(
            value: checkboxValue,
            onChanged: _changeCheck,
          )
        ],
      ),
    );
  }
}