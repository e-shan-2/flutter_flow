import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<dynamic, dynamic> mapData = {};
  var registry = JsonWidgetRegistry.instance;

  Future<Map> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);

    print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    readJson().then((value) {
      setState(() {
        mapData = value;
      });
    });

    if (mapData.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    var widget = JsonWidgetData.fromDynamic(mapData, registry: registry);

    return widget!.build(context: context);
  }
}
