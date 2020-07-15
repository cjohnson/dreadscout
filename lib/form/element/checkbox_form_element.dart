import 'package:flutter/material.dart';

class CheckboxFormElement extends StatefulWidget {
  final String formElementTitle;

  CheckboxFormElement({Key key, this.formElementTitle}) : super(key: key);

  @override
  _CheckboxFormElementState createState() => _CheckboxFormElementState();
}

class _CheckboxFormElementState extends State<CheckboxFormElement> {
  bool checkboxValue = false;

  void _changeCheck(bool value) {
    setState(() {
      checkboxValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget> [
          Text(widget.formElementTitle??'Checkbox Value?'),
          Checkbox(
            value: checkboxValue,
            onChanged: _changeCheck,
          )
        ],
      ),
    );
  }
}