import 'dart:ui';

import 'package:dynamic_widget_firebase/base/dragabe_base.dart';
import 'package:flutter/material.dart';

class MyCustomTextFormField extends DraggableWidget<MyCustomTextFormField> {
  final Offset initContPos;
  final Color itemFieldColor;
  final TextEditingController textController;
  void Function(String)? onChanged;

  MyCustomTextFormField({
    super.key,
    this.onChanged,
    required this.itemFieldColor,
    required this.initContPos,
    required this.textController,
    super.data,
    super.type = DraggableWidgetType.move,
  });

  @override
  MyCustomTextFormField modify({
    Key? key,
    DraggableWidgetType? type,
    MyCustomTextFormField? data,
  }) {
    return MyCustomTextFormField(
      itemFieldColor: itemFieldColor,
      initContPos: initContPos,
      type: type ?? this.type,
      data: data ?? this.data,
      key: key ?? this.key,
      textController: textController,
    );
  }

  @override
  State<MyCustomTextFormField> createState() => _MyCustomTextFormFieldState();

  @override
  Map<String, dynamic> toJson() {
    print("valuation  ${valuation}");
    String colorValue = Colors.white.value.toRadixString(16);
    String dataItem = "";
    return {
      "type": "text",
      "args": {
        "text": valuation,
        "style": {"color": colorValue, "fontSize": 15}
      },
    };
  }
}

String? valuation = "tommorroqw";

// newFunction(String? datavalue) {
//   value = datavalue;
// }

class _MyCustomTextFormFieldState extends State<MyCustomTextFormField> {
  TextEditingController controller = TextEditingController();
  Offset position = const Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    // widget.textController = TextEditingController();
    position = widget.initContPos;
  }

  @override
  Widget build(BuildContext context) {
    MyCustomTextFormField widgetData = widget.data ?? widget;
    print(" my custom text form _----------${valuation}");
    return Draggable(
        data: widgetData.modify(key: widget.key),
        feedback: Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          width: 100,
        ),
        childWhenDragging: Container(
            padding: const EdgeInsets.all(10),
            height: 50,
            width: 100,
            child: Text("heelo")
            // TextFormField(
            //   controller: controller,
            //   decoration: const InputDecoration.collapsed(hintText: 'Text'),
            // ),
            ),
        child: Container(
            padding: const EdgeInsets.all(10),
            height: 50,
            width: 100,
            child: TextFormField(
              onSaved: (newValue) {
                print(newValue);
              },
              onChanged: ((value) {
                valuation = value;

                setState(() {});
                print(valuation);
              }),
              controller: widget.textController,
              decoration: const InputDecoration.collapsed(
                  hintText: 'Text',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
            )));
  }
}
