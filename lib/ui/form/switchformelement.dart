import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwitchFormElement extends StatefulWidget {
  final String dataName;
  bool initialValue;

  SwitchFormElement({
    Key? key,
    required this.dataName,
    this.initialValue = false,
  }) : super(key: key);

  @override
  State<SwitchFormElement> createState() =>
      _SwitchFormElementState(switchState: initialValue);
}

class _SwitchFormElementState extends State<SwitchFormElement> {
  bool switchState;

  _SwitchFormElementState({
    required this.switchState,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.dataName,
            style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.headline1,
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 16.0,
                height: 1),
          ),
          Switch(
            value: switchState,
            onChanged: (newState) => setState(() => switchState = newState),
            activeColor: Colors.black,
          ),
        ],
      ),
    );
  }
}