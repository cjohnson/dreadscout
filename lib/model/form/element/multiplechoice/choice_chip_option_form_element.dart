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

import 'package:dreadscout/model/form/element/input_form_element.dart';

class ChoiceChipOptionFormElement extends InputFormElement {
  final List<String> choiceTitles;

  int choiceChipValue;

  ChoiceChipOptionFormElement(this.choiceTitles,
      {Key key, String formElementTitle, this.choiceChipValue})
      : super(key: key, formElementTitle: formElementTitle);

  @override
  _ChoiceChipOptionFormElementState createState() =>
      _ChoiceChipOptionFormElementState();

  @override
  Set<Object> getElementData() => {choiceChipValue, choiceTitles[choiceChipValue]};
}

class _ChoiceChipOptionFormElementState
    extends State<ChoiceChipOptionFormElement> {
  @override
  Widget build(BuildContext context) {
    return widget.buildInputFormElement(Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        for (int index = 0; index < widget.choiceTitles.length; ++index)
          Row(children: <Widget>[
            ChoiceChip(
              label: Text('${widget.choiceTitles[index]}'),
              selected: widget.choiceChipValue == index,
              onSelected: (value) {
                setState(() {
                  widget.choiceChipValue = value ? index : -1;
                });
              },
            ),
            SizedBox(
              width: 8,
            ),
          ]),
      ],
    ));
  }
}
