import 'package:dynamic_widget_firebase/code/json_widgetable.dart';
import 'package:flutter/material.dart';

class JsonClipRect extends ClipRect implements JsonWidgetable {
  JsonClipRect({
    this.color,
    required this.borderRadius,
  });

  Color? color;
  double? borderRadius;

  @override
  String? type;

  @override
  Map<String, dynamic> toJson() {
    var jsonColor;
    var jsonRadius;

    color ??= const Color(0xFF000000);

    jsonColor = color!.value.toRadixString(16);

    return {
      "type": "clip_rrect",
      "args": {
        "borderRadius": borderRadius,
      },
      "child": {
        "type": "container",
        "args": {
          "color": jsonColor,
          "height": borderRadius,
          "width": borderRadius
        }
      }
    };
  }
}
