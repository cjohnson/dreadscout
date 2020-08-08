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

import 'package:dreadscout/bloc/form/element/multiplechoice/choice_chip_option_form_element_bloc.dart';
import 'package:flutter/material.dart';

import 'package:dreadscout/model/form/element/input_form_element.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChoiceChipOptionFormElement extends InputFormElement {
  final List<String> choiceTitles;

  int choiceChipValue;

  ChoiceChipOptionFormElement(this.choiceTitles,
      {Key key, String formElementTitle, this.choiceChipValue})
      : super(key: key, formElementTitle: formElementTitle);

  @override
  Set<Object> getElementData() =>
      {choiceChipValue, choiceTitles[choiceChipValue]};

  @override
  Widget build(BuildContext context) {
    final ChoiceChipOptionFormElementBloc choiceChipOptionFormElementBloc =
        BlocProvider.of<ChoiceChipOptionFormElementBloc>(context);

    return buildInputFormElement(
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          for (int index = 0; index < choiceTitles.length; index++)
            Row(
              children: [
                BlocBuilder<ChoiceChipOptionFormElementBloc, int>(
                  builder: (context, indexSelected) {
                    return ChoiceChip(
                      label: Text('${choiceTitles[index]}'),
                      selected: choiceChipOptionFormElementBloc.state == index,
                      onSelected: (value) {
                        choiceChipOptionFormElementBloc
                            .add(ChoiceChipOptionFormElementEvent(index));
                      },
                    );
                  },
                ),
                SizedBox(
                  width: 0,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
