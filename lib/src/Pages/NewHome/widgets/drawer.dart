import 'package:capacitacion_flutter_gran_chapo/src/Pages/Home2/home2.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Login/Screens/Login-View.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/VistaUno/itemone.dart';
import 'package:flutter/material.dart';



class DrawerView extends StatefulWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('Drawer Header'),
      ),
      ListTile(
        title: const Text('Item 1'),
        onTap: () {
          Navigator.pushNamed(context, VistaOne.name);
        },
      ),
      ListTile(
        onTap: (){
           Navigator.pushNamed(context, VistaOne.name);
        },
        title: Text('Item 2'),
      ),
      ///////////////////////
      ListTile(
        onTap: (){
           Navigator.pushNamed(context, Home2View.name);
        },
        title: Text('Item 3'),
      ),      
    ]));
  }
}
