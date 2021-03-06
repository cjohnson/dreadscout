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

import 'package:dreadscout/ui/custom/form/element/form_element.dart';
import 'package:flutter/material.dart';

/// [SubmitFormButton] to submit scouting forms.
class SubmitFormButton extends FormElement {
  /// [formTitle] is the title of the current form.
  final String formTitle;

  final void Function() onSubmit;

  /// Optional (required) args constructor for [SubmitFormButton]
  SubmitFormButton(this.onSubmit, {this.formTitle: 'Untitled New Form'});

  @override
  Widget build(BuildContext context) {
    return _buildButtonWrapping(
      FloatingActionButton.extended(
        icon: const Icon(Icons.archive),
        onPressed: onSubmit,
        label: Text("Submit"),
      ),
    );
  }

  Widget _buildButtonWrapping(Widget button) {
    return buildFormElementContainer(Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: 0,
        ),
        button,
      ],
    ));
  }

  getElementData() => null;
}
