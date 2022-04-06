import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:flutter/material.dart';

class LayoutView extends StatelessWidget {
  final Widget body;
  final String? titleAppbar;
  final bool appbar;
  final Widget? drawer;
  final List<Widget>? menuButom;
  final Color colorText;
  final double sizeTextTitle;
  final Widget? leading;
  const LayoutView(
      {Key? key,
      required this.body,
      this.titleAppbar,
      required this.appbar,
      this.colorText = Colors.white,
      this.sizeTextTitle = 17,
      this.drawer, this.menuButom, this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      appBar: appbar?appBar() : null,
      body: body,
    );
  }

  appBar() {
    return AppBar(
      elevation: 0,
      leading: leading,
      centerTitle: false,
      backgroundColor: Flush.colorGlobal,
      title: Text(titleAppbar ?? '',style:DesingText.botonblobal(sizeTextTitle,colorText)),
      
      actions:menuButom,
    );
  }
}
