import 'package:dynamic_widget_firebase/base/dragabe_base.dart';
import 'package:flutter/material.dart';

class MyCustomContainer extends DraggableWidget<MyCustomContainer> {
  final Offset initContPos;
  final Color itemContColor;

  MyCustomContainer({
    super.key,
    required this.itemContColor,
    required this.initContPos,
    super.data,
    super.type = DraggableWidgetType.move,
  });

  @override
  MyCustomContainer modify({
    Key? key,
    DraggableWidgetType? type,
    MyCustomContainer? data,
  }) {
    return MyCustomContainer(
      itemContColor: itemContColor,
      initContPos: initContPos,
      type: type ?? this.type,
      data: data ?? this.data,
      key: key ?? this.key,
    );
  }

  String coloring = Colors.blueAccent.value.toRadixString(16);
  @override
  State<MyCustomContainer> createState() => _MyCustomContainerState();

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": "container",
      "args": {
        "color": coloring,
        // "#FF0000",
        // "padding": jsonpadding,
        // "margin": jsonmargin,
        "height": 120,
        "width": 120,
      },
      // "child": jsonChild,
    };
  }
}

class _MyCustomContainerState extends State<MyCustomContainer> {
  Offset position = const Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initContPos;
  }

  @override
  Widget build(BuildContext context) {
    MyCustomContainer widgetData = widget.data ?? widget;

    return Draggable(
        data: widgetData.modify(key: widget.key),
        feedback: Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            color: widget.itemContColor.withOpacity(0.5),
          ),
        ),
        childWhenDragging: Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            color: widget.itemContColor.withOpacity(0.5),
          ),
        ),
        child: Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            color: widget.itemContColor,
          ),
        ));
  }
}
