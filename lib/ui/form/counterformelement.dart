import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CounterFormElement extends StatefulWidget {
  final String dataName;
  int initialValue;

  CounterFormElement({
    Key? key,
    required this.dataName,
    this.initialValue = 0,
  }) : super(key: key);

  @override
  _CounterFormElementState createState() =>
      _CounterFormElementState(counterState: initialValue);
}

class _CounterFormElementState extends State<CounterFormElement> {
  int counterState;

  _CounterFormElementState({
    required this.counterState,
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
          ElevatedButton(
            onPressed: () => setState(() {
              counterState--;
            }),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(
                FontAwesomeIcons.minus,
                size: 20,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            ),
          ),
          Text(
            '$counterState',
            style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.headline1,
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 18.0,
                height: 1),
          ),
          ElevatedButton(
            onPressed: () => setState(() {
              counterState++;
            }),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(
                FontAwesomeIcons.plus,
                size: 20,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
