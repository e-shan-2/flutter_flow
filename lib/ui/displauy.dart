import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({super.key});

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  var registry = JsonWidgetRegistry.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('json_ui').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something Went Wron");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.data!.docs.isNotEmpty) {
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var dataItem = snapshot.data!.docs;

                String value = dataItem[0].data().toString();

                final valuation = json.decode(value);

                var widget =
                    JsonWidgetData.fromDynamic(valuation, registry: registry);
                return
                    // Text("${dataItem[0].data().toString()}");

                    SizedBox(
                        width: size.width * .6,
                        height: size.height,
                        child: widget!.build(context: context));
              });
        } else {
          return Center(
              child: Column(
            children: [
              ElevatedButton(onPressed: () {}, child: Text("Hello")),
            ],
          ));
        }
      },
    );
  }
}
