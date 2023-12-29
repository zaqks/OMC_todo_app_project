import 'package:flutter/material.dart';

import '../../style/styleVars.dart';

class MyTextField extends StatefulWidget {
  String hint;
  TextInputType inptType;
  int? maxLen;
  TextEditingController ctrl;
  Function? onInput;
  bool? center;

  MyTextField(
      {super.key,
      required this.hint,
      required this.inptType,
      required this.ctrl,
      this.onInput,
      this.maxLen,
      this.center});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    if (widget.onInput != null) {
      widget.ctrl.addListener(
        () {
          widget.onInput!();
        },
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: whiteclr,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
        child: TextField(
          textAlign: widget.center == true ? TextAlign.center : TextAlign.left,
          controller: widget.ctrl,
          obscureText: widget.hint.contains("password"),
          maxLength: widget.maxLen,
          decoration: InputDecoration(
              counterText: "",
              hintText: widget.hint,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(0),
              isDense: true),
          cursorColor: txtclr1,
          style: TextStyle(
            color: txtclr1,
            fontSize: txtsz2,
          ),
          keyboardType: widget.inptType,
        ),
      ),
    );
  }
}
