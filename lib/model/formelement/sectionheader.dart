import 'package:flutter/material.dart';

import '../../ui/form/sectionheaderui.dart';
import '../formelement.dart';

class SectionHeaderFormElement extends ScoutingFormElement {
  SectionHeaderFormElement({id, title}) : super(id: id, title: title, type: 'section_header');

  SectionHeaderFormElement.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
  }

  SectionHeaderFormElement.clone(SectionHeaderFormElement source) {
    id = source.id;
    title = source.title;
  }

  @override
  Widget wrap() => SectionHeaderFormElementUI(formElement: this);
}