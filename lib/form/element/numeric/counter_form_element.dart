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

import 'package:flutter/material.dart';

import 'package:dreadscout/form/element/input_form_element.dart';

// ignore: must_be_immutable
class CounterFormElement extends InputFormElement {
  final int maximumValue;
  final int minimumValue;

  int currentValue;

  CounterFormElement(
      {Key key,
      String formElementTitle,
      this.maximumValue: numerics.int64MaxValue,
      this.minimumValue: 0,
      this.currentValue: 0})
      : super(key: key, formElementTitle: formElementTitle);

  @override
  State<StatefulWidget> createState() => _CounterFormElementState();
}

class _CounterFormElementState extends State<CounterFormElement> {
  void _counterIncrement() {
    // Bounds check and 'improper' value checking
    if (widget.currentValue >= widget.maximumValue) {
      widget.currentValue = widget.maximumValue;

      return;
    }

    setState(() {
      // Standard increment
      ++widget.currentValue;
    });
  }

  void _counterDecrement() {
    // Bounds check and 'improper' value checking
    if (widget.currentValue <= widget.minimumValue) {
      widget.currentValue = widget.minimumValue;

      return;
    }

    setState(() {
      // Standard Decrement
      --widget.currentValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.buildInputFormElement(Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        RaisedButton(
          onPressed: _counterDecrement,
          child: Text('-'),
          color: Colors.lightBlue[100],
        ),
        Container(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Text('${widget.currentValue}'),
        ),
        RaisedButton(
          onPressed: _counterIncrement,
          child: Text('+'),
          color: Colors.lightBlue[100],
        ),
      ],
    ));
  }
}
