import 'dart:convert';

import 'package:flutter/material.dart';

class JsonPostioning extends Positioned {
  const JsonPostioning(
      {super.key,
      required super.child,
      required super.left,
      required super.top});

  Map<String, dynamic> toJson() {
    var jsonChild = jsonEncode(child);
    return {
      jsonEncode("type"): jsonEncode("positioned"),
      jsonEncode("args"): {jsonEncode("left"): left, jsonEncode("top"): top},
      jsonEncode("child"): jsonChild,
    };
  }
}
