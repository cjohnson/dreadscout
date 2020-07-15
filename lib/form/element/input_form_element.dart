import 'package:flutter/material.dart';

/// Base Class [InputFormElement] widget for common form element ideas.
abstract class InputFormElement extends StatefulWidget {
  /// [defaultFormElementTitle] to stand in where no title is given.
  static final String defaultFormElementTitle = 'Datum Value?';

  /// [containerSidePadding] is the left and right padding of the object.
  static final double containerSidePadding = 12.0;

  /// [containerTopBottomPadding] is the top and bottom padding of the object.
  static final double containerTopBottomPadding = 8.0;

  /// Title of the element datum.
  final String formElementTitle;

  /// Default Optional Arguments Constructor for [InputFormElement]
  const InputFormElement({Key key, @required this.formElementTitle}) : super(key: key);

  /// Constructs a basic [InputFormElement] Widget Tree.
  Widget buildInputFormElement(Widget inputMethodWidget) {
    return Container(
      padding: EdgeInsets.only(
        left: InputFormElement.containerSidePadding,
        right: InputFormElement.containerSidePadding,
        top: InputFormElement.containerTopBottomPadding,
        bottom: InputFormElement.containerTopBottomPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget> [
          Text(formElementTitle??InputFormElement.defaultFormElementTitle),
          inputMethodWidget,
        ],
      ),
    );
  }
}