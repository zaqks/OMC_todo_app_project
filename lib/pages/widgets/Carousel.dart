import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  double? fact;
  List<Widget> children;
  Carousel({super.key, required this.children, this.fact});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;
      return SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i in widget.children)
                    Container(
                      width: widget.fact == null ? width : width * widget.fact!,
                      margin: const EdgeInsets.only(right: 5),
                      child: i,
                    )
                ],
              )));
    });
  }
}
