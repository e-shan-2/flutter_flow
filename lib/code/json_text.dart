import 'package:dynamic_widget_firebase/code/json_widgetable.dart';
import 'package:flutter/material.dart';

class TextJson extends Text implements JsonWidgetable {
  TextJson(
    super.data, {
    this.fontSize,
    required this.color,
    super.style,
  });

  double? fontSize;
  Color color;

  @override
  Map<String, dynamic> toJson() {
    String? jsonText;
    jsonText = data;

    String colorValue = color.value.toRadixString(16);

//  var fontSize;

    return {
      "type": "text",
      "args": {
        "text": jsonText,
        "style": {"color": colorValue, "fontSize": fontSize}
      },
    };
  }

  @override
  String? type;
}
