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

import 'file:///C:/Workspace/dreadscout/lib/bloc/form/element/boolean_data_bloc.dart';
import 'package:dreadscout/ui/custom/form/element/input_form_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Custom [SwitchFormElement] widget for simple switch options in a widget
///
/// This form element collects a "Enabled/Disabled" datum.
/// Use for specific input configuration.
class SwitchFormElement extends InputFormElement {
  /// Default Optional Arguments Constructor for [SwitchFormElement].
  SwitchFormElement({Key key, String formElementTitle})
      : super(key: key, formElementTitle: formElementTitle);

  @override
  Widget build(BuildContext context) {
    final BooleanDataBloc switchFormElementBloc =
        BlocProvider.of<BooleanDataBloc>(context);

    return buildInputFormElement(
      BlocBuilder<BooleanDataBloc, bool>(
        builder: (context, switchValue) {
          return Switch(
            value: switchValue,
            onChanged: (newState) {
              switchFormElementBloc.add(BooleanDataBlocEvent.toggleBoolean);
            },
          );
        },
      ),
    );
  }

  bool getElementData() => false;
}
