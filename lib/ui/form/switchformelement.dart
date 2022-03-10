import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/scoutingtemplate.dart';

class SwitchFormElementUI extends StatelessWidget {
  final SwitchFormElement formElement;

  const SwitchFormElementUI({Key? key, required this.formElement})
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
          _SwitchDisplay(formElement: formElement)
        ],
      ),
    );
  }
}

class _SwitchDisplay extends StatefulWidget {
  final SwitchFormElement formElement;

  const _SwitchDisplay({Key? key, required this.formElement}) : super(key: key);

  @override
  State<_SwitchDisplay> createState() => __SwitchDisplayState();
}

class __SwitchDisplayState extends State<_SwitchDisplay> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: widget.formElement.value ?? false,
      onChanged: (newValue) =>
          setState(() => widget.formElement.value = newValue),
      activeColor: Colors.green,
    );
  }
}
