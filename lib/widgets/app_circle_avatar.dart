import 'dart:convert';

import 'package:dynamic_widget_firebase/base/dragabe_base.dart';
import 'package:flutter/material.dart';

class MyCustomCircleAvatar extends DraggableWidget<MyCustomCircleAvatar> {
  final Offset initPos;
  final Color itemColor;

  MyCustomCircleAvatar({
    super.key,
    required this.itemColor,
    required this.initPos,
    super.data,
    super.type = DraggableWidgetType.move,
  });

  @override
  MyCustomCircleAvatar modify({
    Key? key,
    DraggableWidgetType? type,
    MyCustomCircleAvatar? data,
  }) {
    return MyCustomCircleAvatar(
      itemColor: itemColor,
      initPos: initPos,
      type: type ?? this.type,
      data: data ?? this.data,
      key: key ?? this.key,
    );
  }

  final String coloring = Colors.redAccent.value.toRadixString(16);
  @override
  State<MyCustomCircleAvatar> createState() => _MyCustomCircleAvatarState();

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": "clip_rrect",
      "args": {
        "borderRadius": 50,
      },
      "child": {
        "type": "container",
        "args": {"color": coloring, "height": 100, "width": 100}
      }
    };
  }
}

class _MyCustomCircleAvatarState extends State<MyCustomCircleAvatar> {
  Offset position = const Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    MyCustomCircleAvatar widgetData = widget.data ?? widget;

    return Draggable(
      data: widgetData.modify(key: widget.key),
      feedback: CircleAvatar(
        backgroundColor: widget.itemColor.withOpacity(0.5),
        radius: 50,
      ),
      childWhenDragging: CircleAvatar(
        backgroundColor: widget.itemColor.withOpacity(0.5),
        radius: 50,
      ),
      child: CircleAvatar(
        backgroundColor: widget.itemColor,
        radius: 50,
      ),
    );
  }
}
