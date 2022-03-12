
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/formelement/sectionheader.dart';

class SectionHeaderFormElementUI extends StatelessWidget {
  final SectionHeaderFormElement formElement;

  const SectionHeaderFormElementUI({Key? key, required this.formElement})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              formElement.title!,
              style: GoogleFonts.robotoMono(
                  textStyle: Theme.of(context).textTheme.headline1,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  fontSize: 20.0,
                  height: 1),
            ),
          )
        ]
      )
    );
  }
}