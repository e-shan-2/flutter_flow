import 'package:dynamic_widget_firebase/code/json_widgetable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class JsonAppBar extends AppBar implements JsonWidgetable {
  JsonAppBar({
    super.key,
    this.title,
    required super.backgroundColor,
    this.child,
    super.actions,
    this.leading,
  }) : super(title: title, leading: leading);

  final JsonWidgetable? child;
  final JsonWidgetable? title;
  @override
  final JsonWidgetable? leading;

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic>? jsonChild;
    Map<String, dynamic>? jsontitle;
    Map<String, dynamic>? jsonleadinng;
    // json

    // jsonbackgroundColor=col
    type = "app_bar";
    String coloring = backgroundColor!.value.toRadixString(16);
    if (child != null) {
      jsonChild = child!.toJson();
    }
    if (title != null) {
      jsontitle = title!.toJson();
    }
    if (leading != null) {
      jsonleadinng = leading!.toJson();
    }
    return {
      // "title": jsontitle,
      // "backgroudColor": jsonbackgroundColor,
      "type": type,

      "args": {
        "title": title,
        // "leading": jsonleadinng,
        "backgroundColor": coloring,
      }
    };
  }

  @override
  String? type;
}
