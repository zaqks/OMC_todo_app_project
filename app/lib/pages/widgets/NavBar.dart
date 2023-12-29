import 'package:flutter/material.dart';

import '../../style/styleVars.dart';

class Navbar extends StatefulWidget {
  int navIndx;
  Function(int) func;
  List<BottomNavigationBarItem> children;
  Navbar(
      {super.key,
      required this.children,
      required this.func,
      required this.navIndx});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      items: widget.children,
      backgroundColor: Colors.transparent,
      currentIndex: widget.navIndx,
      selectedIconTheme: IconThemeData(color: secclr3, size: txtsz6),
      unselectedIconTheme: IconThemeData(color: txtclr2, size: txtsz4),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (val) {
        widget.navIndx = val;

        widget.func(val);

        setState(() {});
      },
    );
  }
}
