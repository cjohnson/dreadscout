import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/scoutingtemplate.dart';

class CounterFormElementUI extends StatelessWidget {
  final CounterFormElement formElement;

  const CounterFormElementUI({Key? key, required this.formElement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            formElement.title ?? "NO TITLE",
            style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.headline1,
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 16.0,
                height: 1),
          ),
          _CounterDisplay(
            getValue: formElement.getValue,
            setValue: formElement.setValue,
          )
        ],
      ),
    );
  }
}

class _CounterDisplay extends StatefulWidget {
  final int Function() getValue;
  final void Function(int) setValue;

  const _CounterDisplay(
      {required this.getValue, required this.setValue, Key? key})
      : super(key: key);

  @override
  State<_CounterDisplay> createState() => __CounterDisplayState();
}

class __CounterDisplayState extends State<_CounterDisplay> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () => setState(() {
            widget.setValue.call(widget.getValue.call() - 1);
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
        const SizedBox(
          width: 24,
        ),
        Text(
          '${widget.getValue.call()}',
          style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.headline1,
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 18.0,
              height: 1),
        ),
        const SizedBox(
          width: 24,
        ),
        ElevatedButton(
          onPressed: () => setState(() {
            widget.setValue.call(widget.getValue.call() + 1);
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
    );
  }
}
