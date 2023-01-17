import 'package:dynamic_widget_firebase/base/dragabe_base.dart';
import 'package:flutter/material.dart';

class MyCustomCard extends DraggableWidget<MyCustomCard> {
  final Offset initCardPos;
  final Color itemCardColor;

  MyCustomCard({
    super.key,
    required this.itemCardColor,
    required this.initCardPos,
    super.data,
    super.type = DraggableWidgetType.move,
  });

  @override
  MyCustomCard modify({
    Key? key,
    DraggableWidgetType? type,
    MyCustomCard? data,
  }) {
    return MyCustomCard(
      itemCardColor: itemCardColor,
      initCardPos: initCardPos,
      type: type ?? this.type,
      data: data ?? this.data,
      key: key ?? this.key,
    );
  }

  @override
  // MyCustomCard Finished({});

  @override
  State<MyCustomCard> createState() => _MyCustomCardState();

  @override
  Map<String, dynamic> toJson() {
    String coloring = itemCardColor.value.toRadixString(16);
    return {
      "type": "container",
      "args": {
        "color": coloring,
        // "#FF0000",
        // "padding": jsonpadding,
        // "margin": jsonmargin,
        "height": 30,
        "width": 120,
      },
      // "child": jsonChild,
    };
  }
}

class _MyCustomCardState extends State<MyCustomCard> {
  Offset position = const Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initCardPos;
  }

  @override
  Widget build(BuildContext context) {
    MyCustomCard widgetData = widget.data ?? widget;

    return Draggable(
      data: widgetData.modify(key: widget.key),
      feedback: Card(
        color: widget.itemCardColor,
        elevation: 3,
        shadowColor: Colors.redAccent,
        child: const SizedBox(
          height: 30,
          width: 120,
        ),
      ),
      childWhenDragging: Card(
        color: widget.itemCardColor,
        elevation: 3,
        shadowColor: Colors.redAccent,
        child: const SizedBox(
          height: 30,
          width: 120,
        ),
      ),
      child: Card(
        color: widget.itemCardColor,
        elevation: 3,
        shadowColor: Colors.redAccent,
        child: const SizedBox(
          height: 30,
          width: 120,
        ),
      ),
    );
  }
}
