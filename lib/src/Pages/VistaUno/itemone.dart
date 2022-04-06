
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Perfil/Widgets/Header.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Perfil/Widgets/List-Details.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/layout-view.dart';
import 'package:flutter/material.dart';

class VistaOne extends StatelessWidget {
  static const String name = "VistaOne";
  const VistaOne({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutView(
      titleAppbar: 'PERFIL DE CHOFER',
      body: bodyWidget(), appbar: true);
  }
}


Widget bodyWidget() {
  return SingleChildScrollView(
    child: Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
          ],
        )
      ),
    ),
  );
}