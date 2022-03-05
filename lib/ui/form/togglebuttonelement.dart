import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToggleButtonFormElement extends StatefulWidget {
  final String dataName;
  int initialToggle;

  ToggleButtonFormElement({
    Key? key,
    required this.dataName,
    this.initialToggle = 0,
  }) : super(key: key);

  @override
  State<ToggleButtonFormElement> createState() =>
      _ToggleButtonFormElementState(toggleState: initialToggle);
}

class _ToggleButtonFormElementState extends State<ToggleButtonFormElement> {
  int toggleState;
  List<bool> isSelected = [true, false, false, false, false];

  _ToggleButtonFormElementState({
    required this.toggleState,
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
          ToggleButtons(
            children: const <Widget>[
              ClimbToggleButton(title: 'NONE'),
              ClimbToggleButton(title: 'LOW'),
              ClimbToggleButton(title: 'MED'),
              ClimbToggleButton(title: 'HIGH'),
              ClimbToggleButton(title: 'TRAV'),
            ],
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0;
                    buttonIndex < isSelected.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    isSelected[buttonIndex] = true;
                  } else {
                    isSelected[buttonIndex] = false;
                  }
                }
              });
            },
            color: Colors.grey,
            isSelected: isSelected,
          ),
        ],
      ),
    );
  }
}

class ClimbToggleButton extends StatelessWidget {
  final String title;

  const ClimbToggleButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Text(
        title,
        style: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.headline1,
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            height: 1),
      ),
    );
  }
}
