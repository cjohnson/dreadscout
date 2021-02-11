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

import 'package:dreadscout/bloc/form/element/indexed_data_bloc.dart';
import 'package:dreadscout/ui/custom/form/element/input_form_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChoiceChipOptionFormElement extends InputFormElement {
  static BlocProvider<IndexedDataBloc> constructFullElement(
      {@required String formElementTitle, @required List<String> indexList}) {
    return BlocProvider<IndexedDataBloc>(
      create: (_) => IndexedDataBloc(indexList),
      child: ChoiceChipOptionFormElement(
        formElementTitle: formElementTitle,
      ),
    );
  }

  ChoiceChipOptionFormElement({Key key, String formElementTitle})
      : super(key: key, formElementTitle: formElementTitle);

  @override
  Widget build(BuildContext context) {
    // Since the BLoC is provided by the BlocProvider class,
    // the BlocProvider also closes the sink.
    // ignore: close_sinks
    final IndexedDataBloc choiceChipOptionFormElementBloc =
        BlocProvider.of<IndexedDataBloc>(context);

    return buildInputFormElement(
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          for (int index = 0;
              index < choiceChipOptionFormElementBloc.indexList.length;
              index++)
            constructChoiceChipElement(index, choiceChipOptionFormElementBloc),
        ],
      ),
    );
  }

  Row constructChoiceChipElement(
      int index, IndexedDataBloc choiceChipOptionFormElementBloc) {
    return Row(
      children: [
        BlocBuilder<IndexedDataBloc, int>(
          builder: (context, indexSelected) {
            return ChoiceChip(
              label:
                  Text('${choiceChipOptionFormElementBloc.indexList[index]}'),
              selected: choiceChipOptionFormElementBloc.state == index,
              onSelected: (value) {
                choiceChipOptionFormElementBloc
                    .add(IndexedDataBlocEvent(index));
              },
            );
          },
        ),
        SizedBox(
          width: 0,
        ),
      ],
    );
  }
}
