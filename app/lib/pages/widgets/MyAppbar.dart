import 'package:flutter/material.dart';

import '../../style/styleVars.dart';

class MyAppbar extends StatefulWidget {
  String? title;
  bool? backBtn;

  Widget? icn1;
  Widget? icn2;
  Color? bgclr;

  MyAppbar(
      {super.key, this.title, this.backBtn, this.bgclr, this.icn1, this.icn2});

  @override
  State<MyAppbar> createState() => _MyAppbarState();
}

class _MyAppbarState extends State<MyAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65,
      //margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: widget.bgclr ?? secclr1,
        //borderRadius: BorderRadius.circular(10),
        //boxShadow: [shd2]
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 5.0, bottom: 5, right: 10, left: 10),
        child: Row(children: [
          SizedBox(
            width: 55,
            height: 55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.icn1 != null ? widget.icn1! : SizedBox(),
                widget.backBtn == true
                    ? IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: whiteclr,
                        ))
                    : SizedBox(),
              ],
            ),
          ),
          Expanded(
              child: widget.title == null
                  ? SizedBox()
                  : SizedBox(
                      child: Center(
                          child: Text(
                        widget.title!,
                        style: TextStyle(color: whiteclr, fontSize: txtsz2),
                      )),
                    )),
          SizedBox(
            width: 55,
            height: 55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [widget.icn2 != null ? widget.icn2! : SizedBox()],
            ),
          ),
        ]),
      ),
    );
  }
}
