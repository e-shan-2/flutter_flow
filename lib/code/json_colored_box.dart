import 'package:dynamic_widget_firebase/code/json_widgetable.dart';
import 'package:flutter/material.dart';

class JsonColoredBox extends ColoredBox implements JsonWidgetable {
  JsonColoredBox({
    super.key,
    this.child,
    required super.color,
  }) : super(child: child);

  @override
  // ignore: overridden_fields
  final JsonWidgetable? child;

  @override
  Widget fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    var jsonKey;
    // ignore: prefer_typing_uninitialized_variables
    var jsonColor;
    Map<String, dynamic>? jsonChild;

    if (key != null) {
      jsonKey = key.toString();
    }

    if (child != null) {
      jsonChild = child!.toJson();
    }

    return {
      'Key': jsonKey,
      'color': jsonColor,
      'child': jsonChild,
    };
  }

  String? args;

  @override
  String? type;
}
