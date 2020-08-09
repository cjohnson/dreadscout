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
import 'package:dreadscout/bloc/form/element/boolean/boolean_data_bloc.dart';

void testBooleanDataBloc() {
  group('BooleanDataBloc', () {
    // ignore: close_sinks
    BooleanDataBloc booleanDataBlocToggleTestInitialFalse;
    // ignore: close_sinks
    BooleanDataBloc booleanDataBlocToggleTestInitialTrue;

    // ignore: close_sinks
    BooleanDataBloc booleanDataBlocSetTest;

    setUp(() {
      booleanDataBlocToggleTestInitialFalse = BooleanDataBloc(initialState: false);
      booleanDataBlocToggleTestInitialTrue = BooleanDataBloc(initialState: true);

      booleanDataBlocSetTest = BooleanDataBloc(initialState: false);
    });

    test('Initial State of CheckboxFormElementBloc is false', () {
      expect(booleanDataBlocToggleTestInitialFalse.state, false);
      expect(booleanDataBlocToggleTestInitialTrue.state, true);

      expect(booleanDataBlocSetTest.state, false);
    });

    blocTest('emits [true] when BooleanDataBlocEvent.toggleBoolean is added',
      build: () => booleanDataBlocToggleTestInitialFalse,
      act: (bloc) => bloc.add(BooleanDataBlocEvent.toggleBoolean),
      expect: [true],
    );

    blocTest('emits [false] when BooleanDataBlocEvent.toggleBoolean is added',
      build: () => booleanDataBlocToggleTestInitialTrue,
      act: (bloc) => bloc.add(BooleanDataBlocEvent.toggleBoolean),
      expect: [false],
    );

    blocTest('emits [false] when BooleanDataBlocEvent.setFalse is added',
      build: () => booleanDataBlocSetTest,
      act: (bloc) => bloc.add(BooleanDataBlocEvent.setFalse),
      expect: [false],
    );

    blocTest('emits [true] when BooleanDataBlocEvent.setTrue is added',
      build: () => booleanDataBlocSetTest,
      act: (bloc) => bloc.add(BooleanDataBlocEvent.setTrue),
      expect: [true],
    );
  });
}