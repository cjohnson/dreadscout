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

// Testing Packages
import 'package:test/test.dart';

// Flutter Testing Packages
import 'package:bloc_test/bloc_test.dart';

// Internal
import 'package:dreadscout/bloc/form/element/multiplechoice/indexed_data_bloc.dart';

void testIndexedDataBloc() {
  group('IndexedDataBloc', () {
    // ignore: close_sinks
    IndexedDataBloc indexedDataBloc;

    setUp(() {
      indexedDataBloc = IndexedDataBloc(<String>[
        'Option One',
        'Option Two',
        'Option Three',
      ],
      initialIndex: -1);
    });

    test('Initial State of IndexedDataBloc is 1', () {
      expect(indexedDataBloc.state, -1);
    });

    blocTest('emits [1] when IndexedDataBlocEvent(1) is added',
      build: () => indexedDataBloc,
      act: (bloc) => bloc.add(IndexedDataBlocEvent(1)),
      expect: [1],
    );

    blocTest('emits [2] when IndexedDataBlocEvent(2) is added',
      build: () => indexedDataBloc,
      act: (bloc) => bloc.add(IndexedDataBlocEvent(2)),
      expect: [2],
    );
  });
}