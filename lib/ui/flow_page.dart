import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:dynamic_widget_firebase/base/dragabe_base.dart';
import 'package:dynamic_widget_firebase/ui/displauy.dart';
import 'package:dynamic_widget_firebase/widgets/app_card.dart';
import 'package:dynamic_widget_firebase/widgets/app_circle_avatar.dart';
import 'package:dynamic_widget_firebase/widgets/app_floating_actionnbutton.dart';
import 'package:dynamic_widget_firebase/widgets/app_postioned_widget.dart';
import 'package:dynamic_widget_firebase/widgets/app_square.dart';
import 'package:dynamic_widget_firebase/widgets/app_text_form_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FlutterFlow extends StatefulWidget {
  const FlutterFlow({super.key});

  @override
  State<FlutterFlow> createState() => _FlutterFlowState();
}

class _FlutterFlowState extends State<FlutterFlow> {
  Offset position = const Offset(0.0, 0.0);
  Color caughtColor = Colors.white;
  List<JsonPostioning> recievewidgets = [];
  List<Map<String, dynamic>> dataItems = [];
  bool displayScreen = false;
  TextEditingController controller = TextEditingController();
  String textValue = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => const DisplayScreen()),
      //           );
      //         },
      //         icon: Icon(Icons.exit_to_app))
      //   ],
      // ),
      body: Row(children: [
        Container(
            color: Colors.cyanAccent,
            width: size.width * .2,
            height: size.height,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                MyCustomCircleAvatar(
                  itemColor: Colors.redAccent,
                  initPos: Offset(10, 10),
                  // type: DraggableWidgetType.completed,
                ).create(),
                const SizedBox(
                  height: 20,
                ),
                MyCustomContainer(
                  itemContColor: Colors.blueAccent,
                  initContPos: const Offset(10, 10),
                ).create(),
                const SizedBox(
                  height: 20,
                ),
                MyCustomCard(
                  initCardPos: const Offset(10, 10),
                  itemCardColor: Colors.amberAccent,
                ).create(),
                const SizedBox(
                  height: 20,
                ),
                MyCustomTextFormField(
                        itemFieldColor: Colors.white,
                        textController: controller,
                        onChanged: (value) {},
                        initContPos: const Offset(10, 10))
                    .create(),
                const SizedBox(
                  height: 20,
                ),
                MyCustomFloatingActionButton(
                  initContPos: const Offset(10, 10),
                  itemFieldColor: Colors.red,
                ).create()
              ],
            )),
        SizedBox(
          width: size.width * .6,
          height: size.height,
          child: DragTarget<DraggableWidget>(
            onAcceptWithDetails: (details) {
              DraggableWidget newWidget;

              if (details.data.type == DraggableWidgetType.created) {
                newWidget = details.data.modify(
                  key: UniqueKey(),
                );
              } else {
                newWidget = details.data;
              }

              JsonPostioning widget = JsonPostioning(
                left: details.offset.dx - size.width * .2,
                top: details.offset.dy,
                child: newWidget,
              );

              findByKey(Key? key, JsonPostioning element) {
                return (element.child as DraggableWidget).key == key;
              }

              if (newWidget.type == DraggableWidgetType.created) {
                // Why does it add without any SetState ??
                recievewidgets.add(widget);
                dataItems.add(widget.toJson());
              } else if (newWidget.type == DraggableWidgetType.move) {
                int indexAt = recievewidgets.indexWhere((element) {
                  return findByKey(newWidget.key, element);
                });

                // print(indexAt);

                if (indexAt >= 0) {
                  // Need to SetState to refresh List

                  setState(() {
                    // recievewidgets[indexAt] = widget;
                    recievewidgets.removeAt(indexAt);
                    dataItems.removeAt(indexAt);
                    recievewidgets.add(widget);
                    dataItems.add(widget.toJson());
                  });
                }
              }
            },
            builder: (
              BuildContext context,
              List<Widget?> accepted,
              List<dynamic> rejected,
            ) {
              return SizedBox(
                width: size.width * .6,
                height: size.height,
                child: displayScreen
                    ? DisplayScreen()
                    : Stack(
                        children: [
                          DottedBorder(
                            color: Colors.indigoAccent,
                            dashPattern: const [2, 4],
                            strokeWidth: 2,
                            child: Container(),
                          ),
                          ...recievewidgets
                        ],
                      ),
              );
            },
          ),
        ),
        Container(
          width: size.width * .2,
          height: size.height,
          color: Colors.grey.withOpacity(0.5),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DisplayScreen()),
                    );
                  },
                  child: const Text("Results")),
              const Spacer(),
              ElevatedButton(
                  child: const Text("submit"),
                  onPressed: () {
                    if (dataItems.isNotEmpty) {
                      Map<String, dynamic> datapattern = {
                        jsonEncode("type"): jsonEncode("scaffold"),
                        jsonEncode("args"): {
                          jsonEncode("body"): {
                            jsonEncode("type"): jsonEncode("stack"),
                            jsonEncode("children"): dataItems
                          }
                        }
                      };
                      // Map<String, dynamic> allData = {
                      //   "timeStamp": FieldValue.serverTimestamp(),
                      //   "jsonData": datapattern
                      // };
                      FirebaseFirestore.instance
                          .collection("json_ui")
                          .add(datapattern);

                      setState(() {
                        displayScreen = true;
                      });
                      MyCustomCard(
                        initCardPos: const Offset(10, 10),
                        itemCardColor: Colors.amberAccent,
                        type: DraggableWidgetType.completed,
                      ).Finished();

                      MyCustomCircleAvatar(
                        itemColor: Colors.redAccent,
                        initPos: Offset(10, 10),
                        type: DraggableWidgetType.completed,
                      ).Finished();

                      MyCustomContainer(
                        itemContColor: Colors.blueAccent,
                        initContPos: const Offset(10, 10),
                        type: DraggableWidgetType.completed,
                      ).Finished();
                    } else {
                      const snackBar = SnackBar(
                        content: Text(
                          'Please select the Widgets',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.black,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }),
            ],
          ),
        )
      ]),
    );
  }
}
