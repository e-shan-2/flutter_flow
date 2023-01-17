import 'package:flutter/material.dart';

enum DraggableWidgetType { create, created, move, completed }

abstract class DraggableWidget<T extends DraggableWidget<T>>
    extends StatefulWidget {
  const DraggableWidget({
    this.data,
    this.type = DraggableWidgetType.move,
    super.key,
  });

  final DraggableWidgetType type;
  final T? data;

  Map<String, dynamic> toJson();

  /// Create a new Widget with the following properties channged
  DraggableWidget modify({
    Key? key,
    DraggableWidgetType? type,
    T? data,
  });

  T create() {
    var base = this as T;

    T inner = base.modify(
      type: DraggableWidgetType.created,
      data: base,
    ) as T;

    T outer = base.modify(
      type: DraggableWidgetType.create,
      data: inner,
    ) as T;

    return outer;
  }

  T Finished() {
    var base = this as T;

    T Finishing = base.modify(
      type: DraggableWidgetType.completed,
      data: base,
    ) as T;
    return Finishing;
  }
}
