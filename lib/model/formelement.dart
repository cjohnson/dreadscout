import 'package:flutter/material.dart';

abstract class ScoutingFormElement {
  String? id;
  String? title;
  String? type;

  ScoutingFormElement({this.id, this.title, this.type});

  Widget wrap();

  Map<String, dynamic> fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];

    return json;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['type'] = type;

    return json;
  }
}