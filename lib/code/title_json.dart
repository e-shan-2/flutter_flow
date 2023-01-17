import 'package:dynamic_widget_firebase/code/json_widgetable.dart';
import 'package:flutter/material.dart';

class TitleJson extends JsonWidgetable {
  TitleJson({this.child});

  // :super(child:child);

  final JsonWidgetable? child;

  @override
  Element createElement() {
    throw UnimplementedError();
  }

  @override
  String? type;

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonchild;

    jsonchild = child!.toJson();
    type = "title";

    return {
      "title": jsonchild,
    };
  }
}
