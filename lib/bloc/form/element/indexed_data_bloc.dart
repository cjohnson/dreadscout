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

// Dart Packages
import 'package:bloc/bloc.dart';

// Flutter Packages
import 'package:flutter_bloc/flutter_bloc.dart';

/// [IndexedDataBlocEvent] represents an event that has happened on the frontend.
///
/// The constructor represents the new state of the selected multiple choice.
class IndexedDataBlocEvent {
  /// [indexSelect] represents the new index that has been selected.
  int indexSelect;

  /// Constructor that requires the new state index [indexSelect]
  IndexedDataBlocEvent(this.indexSelect);
}

class IndexedDataBloc extends Bloc<IndexedDataBlocEvent, int> {
  /// [indexList] is the list of options in the multiple choice list.
  final List<dynamic> indexList;

  /// Constructor that takes in a list of options and an optional initial value.
  IndexedDataBloc(this.indexList, {int initialIndex: -1}) : super(initialIndex);

  /// [mapEventToState] maps an incoming UI event to a new state change.
  ///
  /// This is an asynchronous factory that allows for UI processing and
  /// rendering alongside data and backend management. This method is where all
  /// of the business logic is executed.
  @override
  Stream<int> mapEventToState(IndexedDataBlocEvent event) async* {
    yield event.indexSelect;
  }
}
