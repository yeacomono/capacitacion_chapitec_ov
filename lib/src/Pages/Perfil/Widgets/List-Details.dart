import 'package:capacitacion_flutter_gran_chapo/src/Pages/Perfil/Bloc/PerfilBloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Singleton/LoginUser.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Speech.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Utils/Colum-Builder.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/Input-global-desing.dart';
import 'package:flutter/material.dart'; 
LoginUser loginUser = LoginUser();
class ListDetailsPerfil extends StatefulWidget {
  const ListDetailsPerfil({ Key? key }) : super(key: key);

  @override
  _ListDetailsPerfilState createState() => _ListDetailsPerfilState();
}

class _ListDetailsPerfilState extends State<ListDetailsPerfil> { 
  PerfilBloc perfilBloc = new PerfilBloc();
  TextEditingController _inputPassword = new TextEditingController();
    TextEditingController _inputPassword2 = new TextEditingController();
 List mapbuild =[];

  //PerfilBloc perfilBloc = PerfilBloc();

 List initialData = [
      {
        "title": Speech.perfilItem[0],
        "subtitle":loginUser.userData.choferOne?.primerNombre??'Null',
      },
      {
        "title": Speech.perfilItem[1],
        "subtitle":loginUser.userData.alias??'Null',
      },
      {
        "title": Speech.perfilItem[2],
        "subtitle":'Cambie su contraseña',
      },
      {
        "title": Speech.perfilItem[3],
        "subtitle":loginUser.userData.brevete??'Null',
      },
      {
        "title": Speech.perfilItem[4],
        "subtitle":loginUser.userData.categoria??'Null',
      },
      {
        "title": Speech.perfilItem[5],
        "subtitle":loginUser.userData.typeGroup??'Null',
      },
      {
        "title": Speech.perfilItem[6],
        "subtitle":loginUser.userData.numCelular??'Null',
      }
    ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 0.0,
      shape:
      borderCard(), //establece los border del contenedor padre de los items
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        width: size.width * 0.85,
        child: FutureBuilder(          
          initialData: initialData,
          future:null,// perfilBloc.loadDataPerfil(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.data!=null){
              mapbuild = snapshot.data;
            }else{
              //mapbuild = perfilBloc.mapbuild;
            }
            return ColumnBuilder(
                itemBuilder: (BuildContext context, int index) {
                  return itemdetalle(index);
                },
                itemCount: mapbuild.length);
          },
        ),
      ),
    );
  }

  Column itemdetalle(int index) {
    return Column(
      children: [
        ListTile(
          onTap: index == 9 || index == 8 || index == 7 || index == 2
              ? () {
                  pressed(index);
                }
              : null,
          subtitle: Text(mapbuild[index]['subtitle'],style: DesingText.regularText(15,Flush.subtituloItems),),
          title: Text(mapbuild[index]['title'],style: DesingText.sansBoldText(19,Flush.tituloItems), ),
        ),
        Divider(
          height: 0,
        ),
      ],
    );
  }

  RoundedRectangleBorder borderCard() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    );
  }

////Metodo para ejexutar segun el item agregue aqui los eventos
  pressed(int index,) {
    if (index == 9) {
      print('object1');
    } else if (index == 8) {
      print('object2');
    } else if (index == 7) {
      print('object3');
    }
    else if (index == 2) {
      print('modalCambiarContraseña');
      return widgetPassword(context);
    }
  }

  widgetPassword(context){
    final size = MediaQuery.of(context).size;
     showDialog(context: context, builder: (context){
        return AlertDialog(          
            title: Text('NUEVA CONTRASEÑA', style: DesingText.sansBoldText(null,Flush.colorGlobal),),
            content: Column(              
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: InputGlobalDesing(
                    isPassword: true,
                      controller: _inputPassword,
                      hintText: 'CONTRASEÑA',
                      width: size.width * 0.70,
                    ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: InputGlobalDesing(
                      isPassword: true,
                      controller: _inputPassword2,
                      hintText: 'REPETIR CONTRASEÑA',
                      width: size.width * 0.70,
                    ),
                ),
              ],
            ),
            /*content: TextField(              
              controller: _inputPassword,
              decoration: ,              
            ),*/
            actions: <Widget>[    
              Container(
                margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Flush.rosado, 
                  borderRadius: BorderRadius.circular(10)
                ),
                width: 60,
                height: 60,
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(
                    Icons.close,
                    color:Colors.white
                  )
                ),
              ),  
              SizedBox(width: 42,),            
              Container(
                margin: EdgeInsets.only(right: 15, bottom: 15),
                decoration: BoxDecoration(
                color: Flush.colorGlobal, borderRadius: BorderRadius.circular(10)),
                width: 150,
                height: 60,
                child: TextButton(
                  onPressed: () {
                    print('CAMBIAR LA CONTRASEÑA '+ _inputPassword.text);
                    perfilBloc.callService(context, loginUser.userData.choferOne?.dni??'', _inputPassword.text, _inputPassword2.text);
                    _inputPassword.text= '';
                    _inputPassword2.text= '';
                  },
                  child: Text('Aceptar',style: DesingText.regularBoldText(20, Colors.white)),
                ),
              )              
            ],
          );
    });
    }
}