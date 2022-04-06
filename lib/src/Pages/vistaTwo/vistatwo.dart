
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Perfil/Widgets/Header.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Perfil/Widgets/List-Details.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/layout-view.dart';
import 'package:flutter/material.dart';

class VistaTwo extends StatelessWidget {
  static const String name = "VistaTwo";
  const VistaTwo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutView(
      titleAppbar: 'Vista chofer gal----------gaaa',
      body: bodyWidget(), appbar: true);
  }
}

Widget bodyWidget() {
  return SingleChildScrollView(
    child: Container(
      color: Colors.black,
      child: Center(
        child: Column(
          children:const [
          ],
        )
      ),
    ),
  );
}