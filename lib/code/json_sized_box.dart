import 'package:dynamic_widget_firebase/code/json_widgetable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class JsonSizedBox extends SizedBox implements JsonWidgetable {
  JsonSizedBox({
    super.key,
    super.height,
    super.width,
    this.child,
  }) : super(child: child);

  @override
  // ignore: overridden_fields
  final JsonWidgetable? child;

  @override
  Map<String, dynamic> toJson() {
    String jsonHeight;
    String jsonWidth;
    Map<String, dynamic>? jsonChild;
    String jsonKey;

    if (child != null) {
      jsonChild = child!.toJson();
    }

    jsonHeight = height.toString();
    jsonWidth = width.toString();
    jsonKey = key.toString();

    return {
      'key': jsonKey,
      'height': jsonHeight,
      'width': jsonWidth,
      'child': jsonChild,
    };
  }

  String? args;

  @override
  String? type;
}
