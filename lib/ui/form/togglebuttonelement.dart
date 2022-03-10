import 'package:dreadscout/ui/form/data/scoutingtemplate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToggleButtonFormElementUI extends StatelessWidget {
  final ToggleButtonFormElement formElement;

  const ToggleButtonFormElementUI({Key? key, required this.formElement})
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
          _ToggleDisplay(formElement: formElement),
        ],
      ),
    );
  }
}

class _ToggleDisplay extends StatefulWidget {
  final ToggleButtonFormElement formElement;

  const _ToggleDisplay({Key? key, required this.formElement}) : super(key: key);

  @override
  State<_ToggleDisplay> createState() => __ToggleDisplayState();
}

class __ToggleDisplayState extends State<_ToggleDisplay> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: const <Widget>[
        _ToggleButton(title: 'NONE'),
        _ToggleButton(title: 'LOW'),
        _ToggleButton(title: 'MED'),
        _ToggleButton(title: 'HIGH'),
        _ToggleButton(title: 'TRAV'),
      ],
      onPressed: (int index) =>
          setState(() => widget.formElement.index = index),
      color: Colors.grey,
      isSelected: widget.formElement.getSelected(),
    );
  }
}

class _ToggleButton extends StatelessWidget {
  final String title;

  const _ToggleButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.headline1,
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          height: 1),
    );
  }
}
