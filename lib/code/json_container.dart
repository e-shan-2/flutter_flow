import 'package:dynamic_widget_firebase/code/json_widgetable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class JsonContainer extends Container implements JsonWidgetable {
  JsonContainer({
    super.key,
    this.child,
    this.width,
    super.color,
    this.height,
    super.decoration,
  }) : super(
          child: child,
          height: height,
          width: width,
        );

  @override
  // ignore: overridden_fields
  final JsonWidgetable? child;
  double? height;
  double? width;
  List<int>? marginP;
  List<int>? paddingP;
  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic>? jsonChild;

    // List<int> jsonpadding;
    String jsondecoration;
    double? jsonHeight;
    double? jsonWidth;
    if (child != null) {
      jsonChild = child!.toJson();
    }
    // jsonColor = color.toString();
    jsondecoration = decoration.toString();
    // jsonpadding = [20, 30];
    // jsonmargin = [20, 30];

    // jsonmargin;
    jsonHeight = height;
    jsonWidth = width;
    print(jsonHeight);
    String coloring = color!.value.toRadixString(16);

    return {
      "type": "container",
      "args": {
        "color": coloring,
        // "#FF0000",
        // "padding": jsonpadding,
        // "margin": jsonmargin,
        "height": jsonHeight,
        "width": jsonWidth,
      },
      "child": jsonChild,
    };
  }

  @override
  String? type;
}
