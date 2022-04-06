import 'dart:async';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Perfil/Services/perfil-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Mixins/AlertsMixin.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Login/Models/UserData.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Singleton/LoginUser.dart';


class PerfilBloc with AlertsMixin{
  static final PerfilBloc _instance =  PerfilBloc._internal();
  factory PerfilBloc(){
    return _instance;
  }
  UserData userData = UserData();
  LoginUser loginUser = LoginUser();  
  //B=bloc
  //C=cntroller
  //S=stream
  StreamController<String?> animatedC =StreamController.broadcast();
  Stream<String?> get animatedS => animatedC.stream;

  callService(context,String user, String password, String password2)async{
    Map<String, dynamic> body ={
      "user_chofer":user,
      "password":password,
    };
    // si ambos campos conciden 
    if(password==password2 ){
      // coinciden y no son vacio
      if(password.length!=0 && password2!=0){
        // cambiar de contraseña
        var respuestaValidate = await PerfilService.serviceValidateUser(body: body);
        if(respuestaValidate["valor"]==1 ){
          // si se cambio correctamente la contraseña
          Navigator.pop(context);
          alertEvento.mostrarCuadro(context, texto:respuestaValidate["msn"]??"",title: "Cambio de Contraseña");
        }else if(respuestaValidate["valor"]==0){
          // si no se cambio correctamente la contraseña
          Navigator.pop(context);
          alertEvento.mostrarCuadro(context, texto:respuestaValidate["msn"]??"",title: "Algo Anda Mal");
        };
      }// coinciden porque ambos son vacio
      else if(password.length==0 || password2==0){
        alertEvento.mostrarCuadro(context, texto:"Tiene que llenar ambos campos",title: "Algo Salio Mal");
      }
      
    }//si no coinciden 
    else if(password!=password2 ){
      alertEvento.mostrarCuadro(context, texto:"Ambas contraseñas tienen que concidir",title: "Algo Salio Mal");
    }
    
    
    
  }

  dispose(){
    animatedC.close();
  }
  PerfilBloc._internal();
}
