import 'package:dynamic_widget_firebase/base/dragabe_base.dart';
import 'package:flutter/material.dart';

class MyCustomFloatingActionButton
    extends DraggableWidget<MyCustomFloatingActionButton> {
  final Offset initContPos;
  final Color itemFieldColor;

  MyCustomFloatingActionButton({
    super.key,
    required this.itemFieldColor,
    required this.initContPos,
    super.data,
    super.type = DraggableWidgetType.move,
  });

  @override
  MyCustomFloatingActionButton modify({
    Key? key,
    DraggableWidgetType? type,
    MyCustomFloatingActionButton? data,
  }) {
    return MyCustomFloatingActionButton(
      itemFieldColor: itemFieldColor,
      initContPos: initContPos,
      type: type ?? this.type,
      data: data ?? this.data,
      key: key ?? this.key,
    );
  }

  @override
  State<MyCustomFloatingActionButton> createState() =>
      _MyCustomFloatingActionButtonState();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

class _MyCustomFloatingActionButtonState
    extends State<MyCustomFloatingActionButton> {
  TextEditingController controller = TextEditingController();
  Offset position = const Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initContPos;
  }

  @override
  Widget build(BuildContext context) {
    MyCustomFloatingActionButton widgetData = widget.data ?? widget;

    return Draggable(
        data: widgetData.modify(key: widget.key),
        feedback: FloatingActionButton(
          onPressed: () {},
          backgroundColor: widget.itemFieldColor,
          child: const Icon(Icons.upload),
        ),
        childWhenDragging: FloatingActionButton(
          onPressed: () {},
          backgroundColor: widget.itemFieldColor,
          child: const Icon(Icons.upload),
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: widget.itemFieldColor,
          child: const Icon(Icons.upload),
        ));
  }
}
