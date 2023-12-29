import 'package:flutter/material.dart';

class MyGrid extends StatefulWidget {
  int columns;
  List<Widget> children;
  double spacing;

  MyGrid(
      {super.key,
      required this.columns,
      required this.children,
      required this.spacing});

  @override
  State<MyGrid> createState() => _MyGridState();
}

class _MyGridState extends State<MyGrid> {
  //
  List<List<Widget>> getColumnLst(
      int columnsNum, List children, double spacing) {
    List<List<Widget>> columns = [];
    for (var i = 0; i < columnsNum; i++) {
      columns.add([]);
    }

    int currentLstId = 0;
    double xspc = spacing;

    for (var i = 0; i < children.length; i++) {
      columns[currentLstId].add(Padding(
        padding: EdgeInsets.only(right: xspc, bottom: spacing),
        child: children[i],
      ));

      currentLstId += 1;

      if (currentLstId == columnsNum - 1) {
        xspc = 0;
      }

      if (currentLstId == columnsNum) {
        currentLstId = 0;
        xspc = spacing;
      }
    }

    return columns;
  }
  //

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;

      List<List<Widget>> columnsLst =
          getColumnLst(widget.columns, widget.children, widget.spacing);

      return SizedBox(
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < columnsLst.length; i++)
              SizedBox(
                width: (width / widget.columns),
                child: Column(
                  children: [
                    for (var j = 0; j < columnsLst[i].length; j++)
                      columnsLst[i][j],
                  ],
                ),
              ),
          ],
        ),
      );
    });
  }
}
