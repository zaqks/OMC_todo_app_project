import 'package:flutter/material.dart';

import '../../style/styleVars.dart';

import 'MyButton.dart';
import 'MySpacer.dart';

showNotif(BuildContext context, String content, int type, [Function? btnFunc]) {
  Navigator.push(
      context,
      PageRouteBuilder(
          opaque: false,
          pageBuilder: (context, _, __) => NotifPage(
                type: type,
                content: content,
                btnTitle: "Ok",
                btnFunc: () async {
                  if (btnFunc != null) {
                    await btnFunc();
                  }
                },
              )));
}

class NotifPage extends StatefulWidget {
  int type; // 0, 1, 2 : error success, info
  String content;
  String btnTitle;
  Function btnFunc;
  NotifPage(
      {super.key,
      required this.content,
      required this.btnTitle,
      required this.btnFunc,
      required this.type});

  @override
  State<NotifPage> createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: shclr3,
      body: Padding(
        padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width / 10,
          left: MediaQuery.of(context).size.width / 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: bgclr1, borderRadius: BorderRadius.circular(10)),
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: widget.type == 0
                      ? Icon(
                          Icons.error_outline,
                          color: lightred,
                          size: txtsz8 * 4,
                        )
                      : (widget.type == 1
                          ? Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: lightgreen, width: 13)),
                              child: Icon(
                                Icons.done,
                                color: lightgreen,
                                size: txtsz8 * 3,
                              ),
                            )
                          : const Icon(
                              Icons.info_outline,
                              color: Colors.blue,
                              size: txtsz8 * 4,
                            )),
                ),
                MySpacer(num: 20),
                Text(
                  widget.content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: txtclr1,
                    fontSize: txtsz5,
                    fontWeight: txtwh3,
                    decoration: TextDecoration.none,
                  ),
                ),
                MySpacer(num: 10),
                MyButton(
                    title: widget.btnTitle,
                    btnFunc: () {
                      widget.btnFunc();
                      Navigator.pop(context);
                    })
              ]),
            )
          ],
        ),
      ),
    );
  }
}
