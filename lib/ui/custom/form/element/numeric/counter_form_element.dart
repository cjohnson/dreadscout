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

import 'package:dart_numerics/dart_numerics.dart' as numerics;
import 'package:dreadscout/bloc/form/element/numeric/counter_form_element_bloc.dart';
import 'package:dreadscout/ui/custom/form/element/input_form_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [CounterFormElement] for numeric value tracking.
class CounterFormElement extends InputFormElement {
  static BlocProvider<CounterFormElementBloc> constructFullElement(
      {@required String formElementTitle,
      int maximumValue: numerics.int64MaxValue,
      int minimumValue: 0,
      int incrementValue: 1,
      int currentValue: 0}) {
    return BlocProvider<CounterFormElementBloc>(
      create: (_) => CounterFormElementBloc(
          maximumValue: maximumValue, minimumValue: minimumValue, incrementValue: incrementValue),
      child: CounterFormElement(
        formElementTitle: formElementTitle,
      ),
    );
  }

  /// Standard Optional Args Constructor.
  CounterFormElement({Key key, String formElementTitle})
      : super(key: key, formElementTitle: formElementTitle);

  /// Default Override for StatefulWidgets.
  @override
  Widget build(BuildContext context) {
    final CounterFormElementBloc counterFormElementBloc =
        BlocProvider.of<CounterFormElementBloc>(context);

    return buildInputFormElement(Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        ElevatedButton(
          onPressed: () {
            counterFormElementBloc.add(CounterFormElementEvent.decrement);
          },
          child: Text('-'),
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.blueGrey[500])),
        ),
        SizedBox(
          width: 12,
        ),
        BlocBuilder<CounterFormElementBloc, int>(
          builder: (context, value) {
            return Text('$value');
          },
        ),
        SizedBox(
          width: 12,
        ),
        ElevatedButton(
          onPressed: () {
            counterFormElementBloc.add(CounterFormElementEvent.increment);
          },
          child: Text('+'),
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.blueGrey[500])),
        ),
      ],
    ));
  }
}
