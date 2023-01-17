import 'package:flutter/material.dart';

// ignore: must_be_immutable
abstract class JsonWidgetable extends Widget {
  JsonWidgetable({super.key});

  Map<String, dynamic> toJson();
  String? type;
}
