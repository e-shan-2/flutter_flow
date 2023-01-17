import 'package:dynamic_widget_firebase/code/json_widgetable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class JsonStack extends Stack implements JsonWidgetable {
  JsonStack({
    super.key,
    required this.children,
  });

  @override
  // ignore: overridden_fields
  List<JsonWidgetable> children;

  @override
  String? type;
  @override
  Map<String, dynamic> toJson() {
    List<JsonWidgetable>? jsonchildren;
    jsonchildren = children;

    return {"type": "stack", "children": jsonchildren};
  }
}
