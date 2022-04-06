import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:flutter/material.dart';

class HeaderPerfil extends StatelessWidget {
  const HeaderPerfil({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  //  PerfilDatos perfil = PerfilDatos();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 25.0,
          ),
          CircleAvatar(
            backgroundColor:Flush.colorGlobal,
            child: Icon(Icons.people,size: 80,),
           /* backgroundImage: NetworkImage(
                  'http://165.227.7.113/${perfil.userimage}'
                ),*/
            radius: 80.0,
          ),
          SizedBox(
            width: 80,
            height: 20.0,
          ),
          /*Text(
            'Mabel Candy',
            style: TextStyle(fontSize: 15.0),
          ),
          Text(
            'Zapana Zapana',
            style: TextStyle(fontSize: 12.0),
          ),
          SizedBox(
            width: 80,
            height: 20.0,
          ),*/
        ],
      ),
    );
  }
}