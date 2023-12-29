import 'package:flutter/material.dart';
import 'package:todo_app/pages/widgets/MyButton.dart';
import 'package:todo_app/pages/widgets/Section.dart';
import 'package:todo_app/style/styleVars.dart';

import "../data/userData.dart";
import "../pages/widgets/TaskCard.dart";
import "../pages/widgets//MySpacer.dart";
import "../pages/widgets/MyGrid.dart";
import "../pages/widgets/MyTextField.dart";

import 'widgets/MyAppbar.dart';

import "../api/tasks/tasks.dart";

Function? updateHomePage;
refreshHomePage() async {
  userTasks = await getTasks();
  await updateHomePage!();
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController addTaskCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    updateHomePage ??= () {
      setState(() {});
    };
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: MyAppbar(
          icn2: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(color: bgclr1, shape: BoxShape.circle),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.person_outline,
                  size: 35,
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: secclr1,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Your\nTasks",
                    style: TextStyle(color: txtclr5, fontSize: txtsz7),
                  ),
                ],
              ),
              MySpacer(num: 15),
              //

              Section(children: [
                Row(
                  children: [
                    Expanded(
                      child: MyTextField(
                          hint: "New Task",
                          inptType: TextInputType.text,
                          ctrl: addTaskCtrl),
                    ),
                    MyCircleIcnButton(
                        onPressed: () async {
                          await addTask(addTaskCtrl.text);
                          addTaskCtrl.text = "";
                          await refreshHomePage();
                        },
                        icn: Icons.add,
                        bgClr: secclr1)
                  ],
                ),
              ]),
              MySpacer(num: 4),
              MyGrid(columns: 2, spacing: 10, children: [
                for (String i in userTasks.keys) TaskCard(taskId: i),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
