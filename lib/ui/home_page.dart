/*
The MIT License (MIT)

Copyright (c) 2020 Collin Johnson/FRC Team 3656

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
 */

import 'package:flutter/material.dart';

import 'package:dreadscout/ui/custom/form/element/boolean/checkbox_form_element.dart';
import 'package:dreadscout/ui/custom/form/element/multiplechoice/choice_chip_option_form_element.dart';
import 'package:dreadscout/ui/custom/form/element/multiplechoice/radio_option_form_element.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Dreadscout Home Page [DreadScoutHomePage]
///
/// This is the Home Page of the Dreadscout Application.
/// This acts as a gateway to multiple different subpages.
class DreadScoutHomePage extends StatelessWidget {
  DreadScoutHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
            child: Image(
              image: AssetImage('assets/images/dreadbots.jpg'),
            ),
          ),
          Positioned(
            left: 20.0,
            bottom: 25.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dexter Dreadbots', style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w500, fontFamily: 'Arial', letterSpacing: 1.2),),
                Text('3656', style: TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.w600, fontFamily: 'Arial', letterSpacing: 1.2),),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.locationArrow,
                      size: 16.0,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.0,),
                    Text('Dexter, Michigan USA', style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w500, fontFamily: 'Arial', letterSpacing: 1.2),)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}