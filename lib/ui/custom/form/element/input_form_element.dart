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

import 'file:///C:/Workspace/dreadscout/lib/ui/custom/form/element/form_element.dart';

/// Base Class [InputFormElement] widget for common form element ideas.
abstract class InputFormElement extends FormElement {
  /// [defaultFormElementTitle] to stand in where no title is given.
  static final String defaultFormElementTitle = 'Datum Value?';

  /// Title of the element datum.
  final String formElementTitle;

  /// Default Optional Arguments Constructor for [InputFormElement]
  const InputFormElement({Key key, @required this.formElementTitle})
      : super(key: key);

  /// Constructs a basic [InputFormElement] Widget Tree.
  Widget buildInputFormElement(Widget inputMethodWidget) {
    return buildFormElementContainer(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(formElementTitle ?? InputFormElement.defaultFormElementTitle),
          inputMethodWidget,
        ],
      ),
    );
  }
}
