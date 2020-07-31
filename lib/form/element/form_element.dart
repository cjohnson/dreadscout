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

abstract class FormElement extends StatefulWidget {
  /// [containerSidePadding] is the left and right padding of the object.
  static final double containerSidePadding = 12.0;

  /// [containerTopBottomPadding] is the top and bottom padding of the object.
  static final double containerTopBottomPadding = 8.0;

  /// [FormElement] default optional key args constructor for default StatefulWidget Objects.
  const FormElement({Key key}) : super(key: key);

  /// Constructs a special [InputFormElement] Widget Tree for special buttons.
  Widget buildFormSubmitFormElement(Widget inputMethodWidget) {
    return Container(
      padding: EdgeInsets.only(
        left: FormElement.containerSidePadding,
        right: FormElement.containerSidePadding,
        top: FormElement.containerTopBottomPadding,
        bottom: FormElement.containerTopBottomPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(),
          inputMethodWidget,
        ],
      ),
    );
  }
}