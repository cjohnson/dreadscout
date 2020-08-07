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

import 'package:dreadscout/bloc/form/element/multiplechoice/radio_option_form_element_bloc.dart';
import 'package:flutter/material.dart';

import 'package:dreadscout/model/form/element/input_form_element.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Custom [RadioOptionFormElement] Widget for Multiple Choice Style Options.
///
/// This form element collects a multiple choice style option.
/// Example: Robot Hab Level: 1st, 2nd, 3rd
class RadioOptionFormElement extends InputFormElement {
  static BlocProvider<RadioOptionFormElementBloc> constructFullElement(
      {@required String formElementTitle, @required List<String> radioTitles}) {
    return BlocProvider<RadioOptionFormElementBloc>(
      create: (_) => RadioOptionFormElementBloc(radioTitles),
      child: RadioOptionFormElement(
        formElementTitle: formElementTitle,
      ),
    );
  }

  /// Default Optional Arguments Constructor for [RadioOptionFormElement].
  RadioOptionFormElement({Key key, String formElementTitle})
      : super(key: key, formElementTitle: formElementTitle);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final RadioOptionFormElementBloc bloc =
        context.bloc<RadioOptionFormElementBloc>();

    return buildInputFormElement(
      Container(
        child: Row(
          children: [
            for (int index = 0; index < bloc.radioTitles.length; ++index)
              Column(mainAxisSize: MainAxisSize.min, children: [
                Text('${bloc.radioTitles[index]}'),
                BlocBuilder<RadioOptionFormElementBloc, int>(
                    builder: (context, indexSelected) {
                  return Radio<int>(
                    value: index,
                    groupValue: bloc.state,
                    onChanged: (value) {
                      bloc.add(RadioOptionFormElementEvent(index));
                    },
                  );
                }),
              ])
          ],
        ),
      ),
    );
  }
}
