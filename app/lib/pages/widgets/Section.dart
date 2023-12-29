import 'package:flutter/material.dart';

import '../../style/styleVars.dart';

class Section extends StatefulWidget {
  String? title;
  Widget? subTitle;

  List<Widget> children;
  bool? lstMode;
  bool? borders;

  Color? titleClr;
  bool? disablePadding;
  Section(
      {super.key,
      this.title,
      this.subTitle,
      required this.children,
      this.lstMode,
      this.borders,
      this.titleClr,
      this.disablePadding});

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.disablePadding == true
          ? const EdgeInsets.all(0)
          : const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: widget.lstMode == true ? null : [shd1],
          borderRadius: BorderRadius.circular(10),
          color: widget.lstMode == true ? null : bgclr1,
          border: widget.borders == true ? Border.all(color: secclr2) : null),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        widget.title != null
            ? SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        child: Text(
                          widget.title!,
                          style: TextStyle(
                              fontSize: txtsz4,
                              color: widget.titleClr ?? txtclr1),
                        ),
                      ),
                      widget.subTitle == null
                          ? const SizedBox()
                          : FittedBox(child: widget.subTitle!),
                    ],
                  ),
                ),
              )
            : SizedBox(),
        Column(
          children: widget.children,
        )
      ]),
    );
  }
}
