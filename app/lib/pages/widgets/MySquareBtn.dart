import 'package:flutter/material.dart';

import '../../style/styleVars.dart';

class MySquareButton extends StatefulWidget {
  String? title;
  Function btnFunc;
  bool? invert;
  bool? border;
  Color color;

  MySquareButton({
    super.key,
    this.title,
    required this.btnFunc,
    required this.color,
    this.invert,
    this.border,
  });

  @override
  State<MySquareButton> createState() => _MySquareButtonState();
}

class _MySquareButtonState extends State<MySquareButton> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: 45,
        height: 45,
        //
        decoration: BoxDecoration(
            border:
                widget.border == true ? Border.all(color: widget.color) : null,
            borderRadius: BorderRadius.circular(5),
            color: widget.invert == true ? whiteclr : widget.color),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Text(
                widget.title!,
                style: TextStyle(
                    color: widget.invert == true ? blackclr : whiteclr,
                    fontSize: txtsz2),
                textAlign: TextAlign.center,
              ))
            ],
          ),
          onPressed: () {
            widget.btnFunc();
          },
        ),
      );
    });
  }
}
