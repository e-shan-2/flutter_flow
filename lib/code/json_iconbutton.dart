import 'package:dynamic_widget_firebase/code/json_widgetable.dart';
import 'package:flutter/material.dart';

class JsonIconButton extends IconButton implements JsonWidgetable {
  JsonIconButton({required super.onPressed, required super.icon});

  // JsonIcon({
  //   super.key,
  //   super.onPressed,
  //   required super.icon,
  // });

  @override
  String? type;

  @override
  Map<String, dynamic> toJson() {
    var iconJson;

    return {
      "type": "icon_button",
      "args": {
        "icon": {
          "type": "icon",
          "args": {
            "icon": {"codePoint": 234, "fontFamily": "MaterailIcons "}
          }
        }
      }
    };
  }
}
