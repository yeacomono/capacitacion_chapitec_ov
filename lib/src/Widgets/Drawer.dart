import 'package:capacitacion_flutter_gran_chapo/src/Pages/Login/Screens/Login-View.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Perfil/Perfil-View.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Bloc/PaperRuta.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Bloc/ProgramBloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Program-View.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/DrawerHeader.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  PaperRutaBLoc _paperRutaBLoc = PaperRutaBLoc();
  final List<dynamic> mapbuild = [
    {
      "title": 'PROGRAMACIÓN',
      "subtitle": "",
      //"icon1": IconString.home,
      //"icon2": 'accessibility',
    },
    /*{
      "title": 'DESTINOS Y CANTIDADES',
      "subtitle": 'IconString',
      //"icon1": IconString.gps,
      //"icon2": IconString,
    },*/
    {
      "title": 'PERFIL',
      "subtitle": 'IconString',
      //"icon1": IconString.gps,
      //"icon2": IconString,
    },
    {
      "title": 'SALIR',
      "subtitle": 'IconString',
      //"icon1": IconString.gps,
      //"icon2": IconString,
    }
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: size.width * 0.75),
        child: Drawer(
          child: Column(
            children: [
              CabezalDrawer(),
              itemsDrawer()
            ],
        ),
      )
    );
  }

  Widget itemsDrawer() {
    return Expanded(
      child: Container(
        color: Flush.colorGlobal,
        child: ListView.builder(
            padding: EdgeInsets.all(0),
            itemCount: mapbuild.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    onTap: () {
                      pressed(index);
                    },
                    //leading: IconString.getIcon(mapbuild[index]['icon1']),
                    title: Text(
                      mapbuild[index]['title'],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Divider(
                    height: 0,
                    //color: Colors.grey,
                  )
                ],
              );
            }),
      ),
    );
  }

  pressed(int index) {
    if (index == 0) {
      print('Ingresado a Programación');
      _paperRutaBLoc.initRuta = true;
       ProgramacionBloc.bloqProcess = false;

      Navigator.pushReplacementNamed(context, ProgramcionView.name);
      //Navigator.pushReplacementNamed(context, HomeView.name);
    }
    if (index == 1) {
      print('Ingresando a relevos');
      //perfilBloc.loadDataPerfil();
      //Navigator.pushReplacementNamed(context, RelevosView.name);
      Navigator.pushNamed(context, PerfilView.name);
    }
    if (index == 2) {
      //Navigator.pushReplacementNamed(context, EscalasView.name);
      print('item3');
      Navigator.popAndPushNamed(context, LoginView.name);
    }
    if (index == 3) {
     // Navigator.pushNamed(context, PerfilView.name);
      //Navigator.pushNamed(context, PerfilView.name);
      print('item4');
    }
    if (index == 4) {
      
      print('item4');
    }
  }
}
