import 'package:flutter/material.dart';

class MySpacer extends StatelessWidget {
  double num;
  bool? xAxis;

  MySpacer({super.key, required this.num, this.xAxis});

  double unit = 2.5;

  @override
  Widget build(BuildContext context) {
    return xAxis == true
        ? SizedBox(width: unit * num)
        : SizedBox(height: unit * num);
  }
}
