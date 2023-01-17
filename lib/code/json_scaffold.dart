import 'dart:convert';

import 'package:dynamic_widget_firebase/code/json_widgetable.dart';
import 'package:flutter/material.dart';

class JsonScaffold extends Scaffold implements JsonWidgetable {
  JsonScaffold({
    this.appbar,
    this.body,
  });

  @override
  String? type;

  // @override
  // final ScaffoldJsonWidget? appbar;
  // final ScaffoldJsonWidget? body;
  final JsonWidgetable? appbar;
  final JsonWidgetable? body;

  @override
  Map<String, dynamic> toJson() {
    var jsonbody;
    var jsonappBar;

    type = "scaffold";

    if (appbar != null) {
      jsonappBar = appbar!.toJson();
    }

    if (body != null) {
      jsonbody = body!.toJson();
    }

    type = jsonEncode(type);

    return {
      jsonEncode("type"): "$type",
      jsonEncode("args"):
          "{${jsonEncode("appBar")}: ${jsonEncode(jsonappBar)}  , ${jsonEncode("body")}:${jsonEncode(jsonbody)}}",
    };
  }
}
