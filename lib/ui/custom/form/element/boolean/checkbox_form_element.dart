// The MIT License (MIT)
//
// Copyright (c) 2020 Collin Johnson/FRC Team 3656
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// Internal Packages
import 'package:dreadscout/bloc/form/element/boolean/boolean_data_bloc.dart';
import 'package:dreadscout/ui/custom/form/element/input_form_element.dart';

// Flutter Packages
import 'package:flutter/material.dart';

// Flutter Library Packages
import 'package:flutter_bloc/flutter_bloc.dart';

/// [CheckboxFormElement] is a custom data collection widget for boolean data.
///
/// This form element collects "Yes/No" or "True/False" data. This can be used
/// in different capacities, including both collecting boolean data (whether an
/// event happened during a match) or to enable or disable certain features
/// while scouting.
/// Example of boolean data collection:
///   Robot experienced technical issues? CHECKBOX: Yes/No.
/// Example of feature toggle:
///   Collect Scouter Information? CHECKBOX: Yes/No.
class CheckboxFormElement extends InputFormElement {
  /// [constructFullElement] reduces [BlocProvider] widget creation boilerplate.
  ///
  /// This method acts almost as a redirected constructor in Dart, however it
  /// returns a different type; that of [BlocProvider], because this class's
  /// business logic is managed by a BLoC.
  /// [formElementTitle] is the title of the form element (title to the left of
  /// data collection).
  static BlocProvider<BooleanDataBloc> constructFullElement(
      {@required String formElementTitle}) {
    return BlocProvider<BooleanDataBloc>(
      // BLoC Class to Instantiate the BLoC.
      create: (_) => BooleanDataBloc(),
      // Instance of the CheckboxFormElement Widget.
      child: CheckboxFormElement(
        formElementTitle: formElementTitle,
      ),
    );
  }

  /// Constructs a default instance of [CheckboxFormElement].
  ///
  /// [key] is the superclass Flutter key.
  /// [formElementTitle] is the title of the form element (title to the left of
  /// data collection interface).
  CheckboxFormElement({Key key, String formElementTitle})
      : super(key: key, formElementTitle: formElementTitle);

  /// Overridden [build] method of superclass [StatelessWidget].
  ///
  /// Constructs a [CheckboxFormElement]. State management is handled by
  /// flutter_bloc, through a [BlocBuilder] object which will handle
  /// re-rendering of the User Interface when the BLoC state changes
  /// asynchronously.
  @override
  Widget build(BuildContext context) {
    // Since the BLoC is provided by the BlocProvider class,
    // the BlocProvider also closes the sink.
    // ignore: close_sinks
    final BooleanDataBloc checkboxFormElementBloc =
        context.bloc<BooleanDataBloc>();

    // Return Extension of InputFormElement's default style and UI.
    return buildInputFormElement(
      // BlocBuilder for Handling State Management & Re-rendering.
      BlocBuilder<BooleanDataBloc, bool>(
        builder: (context, checkboxValue) {
          // On re-render, use latest state data. (checkboxValue).
          return Checkbox(
            value: checkboxValue,
            onChanged: (newState) {
              // Add an instruction to the BLoC to update state & re-render.
              checkboxFormElementBloc.add(BooleanDataBlocEvent.toggleBoolean);
            },
          );
        },
      ),
    );
  }
}
