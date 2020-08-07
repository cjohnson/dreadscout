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

import 'file:///C:/Workspace/dreadscout/lib/bloc/form/element/boolean/checkbox_form_element_bloc.dart';
import 'package:flutter/material.dart';

import 'package:dreadscout/model/form/element/input_form_element.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Custom [CheckboxFormElement] widget for simple checkbox options in a Widget.
///
/// This form element collects a "Yes/No" or "True/False" datum.
/// Example: Robot Broke? CHECKBOX: Yes/No.
class CheckboxFormElement extends InputFormElement {
  /// Default Optional Arguments Constructor for [CheckboxFormElement].
  CheckboxFormElement(
      {Key key, String formElementTitle}) : super(key: key, formElementTitle: formElementTitle);

  @override
  Widget build(BuildContext context) {
    final CheckboxFormElementBloc checkboxFormElementBloc = BlocProvider.of<CheckboxFormElementBloc>(context);

    return buildInputFormElement(
      BlocBuilder<CheckboxFormElementBloc, bool>(
        builder: (context, checkboxValue) {
          return Checkbox(
            value: checkboxValue,
            onChanged: (newState) {
              checkboxFormElementBloc.add(CheckboxFormElementEvent.toggleCheck);
            },
          );
        },
      ),
    );
  }

  @override
  getElementData() => '';
}