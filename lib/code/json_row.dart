import 'package:dynamic_widget_firebase/code/json_widgetable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class JsonRow extends Row implements JsonWidgetable {
  JsonRow({
    super.key,
    required this.children,
  });

  @override
  // ignore: overridden_fields
  List<JsonWidgetable> children;

  @override
  Map<String, dynamic> toJson() {
    List<JsonWidgetable>? jsonchildren;
    jsonchildren = children;

    return {"type": "row", "children": jsonchildren};
  }

  @override
  String? type;
}
