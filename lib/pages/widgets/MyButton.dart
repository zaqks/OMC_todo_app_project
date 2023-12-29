import 'package:flutter/material.dart';

import '../../style/styleVars.dart';

class MyButton extends StatefulWidget {
  String title;
  IconData? icon;
  Widget? child;
  Function btnFunc;
  bool? invert;
  bool? border;
  bool? big;
  bool? bypassState;

  MyButton(
      {super.key,
      required this.title,
      this.icon,
      required this.btnFunc,
      this.invert,
      this.border,
      this.child,
      this.big,
      this.bypassState});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        decoration: BoxDecoration(
            border: widget.border == true ? Border.all(color: whiteclr) : null,
            borderRadius: BorderRadius.circular(5),
            color: widget.invert == true ? whiteclr : null,
            gradient: widget.invert == true
                ? null
                : LinearGradient(colors: [secclr1, secclr2]),
            boxShadow: [shd1]),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.all(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: loading
                ? [
                    SizedBox(
                        width: txtsz4,
                        height: txtsz4,
                        child: CircularProgressIndicator(
                          color: widget.invert == true ? secclr1 : whiteclr,
                          strokeWidth: 2,
                        ))
                  ]
                : [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            color: widget.invert == true ? blackclr : whiteclr,
                            fontSize: widget.big == true ? txtsz3 : txtsz2),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    widget.icon != null
                        ? Icon(widget.icon!,
                            color: widget.invert == true ? blackclr : whiteclr,
                            size: widget.big == true ? txtsz3 : txtsz2)
                        : SizedBox(),
                    widget.child != null ? widget.child! : const SizedBox(),
                  ],
          ),
          onPressed: () async {
            if (!loading) {
              loading = true;
              setState(() {});
              //
              await widget.btnFunc();
              //
              loading = false;
              if (widget.bypassState != true) {
                setState(() {});
              }
            }
          },
        ),
      );
    });
  }
}

//
class MyCircleIcnButton extends StatefulWidget {
  Function onPressed;
  IconData icn;
  Color bgClr;

  MyCircleIcnButton(
      {super.key,
      required this.onPressed,
      required this.icn,
      required this.bgClr});

  @override
  State<MyCircleIcnButton> createState() => _MyCircleIcnButtonState();
}

class _MyCircleIcnButtonState extends State<MyCircleIcnButton> {
  bool done = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: widget.bgClr, shape: BoxShape.circle),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              splashRadius: 15,
              padding: EdgeInsets.zero,
              icon: !done
                  ? CircularProgressIndicator(
                      color: whiteclr,
                    )
                  : Icon(
                      widget.icn,
                      color: whiteclr,
                    ),
              onPressed: () async {
                if (done) {
                  done = false;
                  setState(() {});
                  await widget.onPressed();
                  done = true;
                  setState(() {});
                }
              })
        ],
      ),
    );
  }
}
