import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import "../../style/styleVars.dart";
import "../../data/userData.dart";
import "../../pages/HomePage.dart";

import '../widgets/MyButton.dart';
import '../widgets/MySpacer.dart';
import "../widgets/MyTextField.dart";

import "Section.dart";
import "../../api/tasks/tasks.dart";

class TaskCard extends StatefulWidget {
  String taskId;
  TaskCard({super.key, required this.taskId});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool expanded = true;
  bool editing = false;
  TextEditingController editingCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Section(
      titleClr: blackclr,
      title: widget.taskId,
      subTitle: SizedBox(
        width: 25,
        height: 25,
        child: IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 15,
          iconSize: 30,
          onPressed: () {
            expanded = !expanded;
            if (editing) {
              editing = false;
            }
            setState(() {});
          },
          icon: Icon(expanded
              ? Icons.arrow_drop_up_sharp
              : Icons.arrow_drop_down_circle_outlined),
        ),
      ),
      children: expanded
          ? [
              editing
                  ? Section(
                      borders: true,
                      lstMode: true,

                      //
                      children: [
                        MyTextField(
                          hint: "Changed your mind?",
                          ctrl: editingCtrl,
                          inptType: TextInputType.multiline,
                          center: true,
                        ),
                      ],
                    )
                  : Text(
                      userTasks[widget.taskId]["content"],
                      style: TextStyle(
                          color: txtclr1,
                          fontSize: txtsz3,
                          decoration: userTasks[widget.taskId]["completed"]
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
              MySpacer(num: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCircleIcnButton(
                    icn: Icons.delete_outline,
                    bgClr: lightred,
                    onPressed: () async {
                      await deleteTask(widget.taskId);
                      await refreshHomePage();
                    },
                  ),
                  Row(
                    children: [
                      MyCircleIcnButton(
                        icn: !editing ? Icons.edit : Icons.clear,
                        bgClr: secclr1,
                        onPressed: () async {
                          editing = !editing;
                          if (editing) {
                            editingCtrl.text =
                                userTasks[widget.taskId]["content"];
                          }

                          setState(() {});
                        },
                      ),
                      Row(
                        children: userTasks[widget.taskId]["completed"]!
                            ? []
                            : [
                                MySpacer(
                                  num: 2,
                                  xAxis: true,
                                ),
                                MyCircleIcnButton(
                                  icn: Icons.check,
                                  bgClr: editing ? secclr1 : lightgreen,
                                  onPressed: () async {
                                    if (editing) {
                                      await editTask(
                                          widget.taskId, editingCtrl.text);

                                      editing = false;
                                    } else {
                                      await completeTask(widget.taskId);
                                    }
                                    await refreshHomePage();
                                  },
                                )
                              ],
                      ),
                    ],
                  ),
                ],
              )
            ]
          : [],
    );
  }
}
