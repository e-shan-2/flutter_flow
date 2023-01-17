import 'package:dynamic_widget_firebase/code/json_widgetable.dart';
import 'package:flutter/material.dart';

class JosnCircleAvatar extends CircleAvatar implements JsonWidgetable {
  JosnCircleAvatar({
    super.radius,
    super.backgroundColor,
    this.child,
  });

  @override
  String? type;

  final JsonWidgetable? child;

  @override
  Map<String, dynamic> toJson() {
    String backgroudColorJson;
    String jsonRadius;
    Map<String, dynamic>? jsonChild;

    jsonRadius = radius.toString();
    // ignore: unnecessary_string_interpolations
    backgroudColorJson = "${backgroundColor!.value.toRadixString(16)}";
    if (child != null) {
      jsonChild = child!.toJson();
    }

    return {
      "type": "clip_rrect",
      "args": {
        "borderRadius": jsonRadius,
      },
      "child": {
        "type": "container",
        "args": {
          "color": backgroudColorJson,
          "height": jsonRadius,
          "width": jsonRadius
        }
      }
    };

    // {
    //   "type": "circle_avatar",
    //   "args": {
    //     "color": backgroudColorJson,
    //     // "#FF0000",
    //     "radius": jsonRadius,
    //   },
    //   "child": jsonChild,
    // };
  }
}
