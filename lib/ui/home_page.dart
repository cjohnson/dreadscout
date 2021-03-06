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

import 'package:dreadscout/ui/custom/form/element/checkbox_form_element.dart';
import 'package:dreadscout/ui/custom/form/element/choice_chip_option_form_element.dart';
import 'package:dreadscout/ui/custom/form/element/counter_form_element.dart';
import 'package:flutter/material.dart';

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
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            expandedHeight: 200.0,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                '3656 Dreadbots',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              background: Image(
                image: AssetImage('assets/images/dreadbots.jpg'),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                CounterFormElement.constructFullElement(
                    formElementTitle: 'Cargo'),
                ChoiceChipOptionFormElement.constructFullElement(
                    formElementTitle: 'Hab Level Achieved',
                    indexList: ['1st', '2nd', '3rd']),
                CheckboxFormElement.constructFullElement(
                    formElementTitle: 'Robot Broke?')
              ],
            ),
          )
        ],
      ),
    );
  }
}
