
import 'dart:async';
import 'package:flutter/cupertino.dart';
////////////////
import 'package:capacitacion_flutter_gran_chapo/src/Mixins/AlertsMixin.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Home/UI/Screens/Home-View.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Login/Models/UserData.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Login/Services/Login-service.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Singleton/LoginUser.dart';


class LoginBloc with AlertsMixin{
  static final LoginBloc _instance =  LoginBloc._internal();
  factory LoginBloc(){
    return _instance;
  }
  UserData userData = UserData();
  LoginUser loginUser = LoginUser();
  //B=bloc
  //C=cntroller
  //S=stream
  StreamController<String?> animatedC =StreamController.broadcast();
  Stream<String?> get animatedS => animatedC.stream;

  callService(context,String user, String password)async{
    Map<String, dynamic> body ={
      "user_chofer":user,
      "password":password,
    };
    // validacion de contraseña
    var respuestaValidate = await LoginService.serviceValidateUser(body: body);
    if(respuestaValidate["valor"]==1 ){
      //validacion de usuario y trae los datos
      var respuestatus = await LoginService.serviceLogin(body: body);
      if(respuestatus["valor"]==1 ){
        userData = UserData.fromJson(respuestatus["data"][0]);
        loginUser.userData = userData;
        print("${loginUser.userData.brevete}");
        //Navigator.pop(context);
        Navigator.pushReplacementNamed(context, HomeView.name);
      }else if(respuestatus["valor"]==0){ // si el usuario no existe
        animatedC.sink.add("Loading");
        Timer(Duration(seconds: 1), (){
        animatedC.sink.add("INGRESAR");
        alertEvento.mostrarCuadro(context, texto:respuestatus["msn"]??"",title: "Algo Anda Mal");
        });
      // Navigator.pop(context);
      //Timer(Duration(milliseconds: 200), (){modalError(context);});
      }
      // si la contraseña o el usuario estan mal 
    }else if(respuestaValidate["valor"]==0){
      animatedC.sink.add("Loading");
      Timer(Duration(seconds: 1), (){
      animatedC.sink.add("INGRESAR");
      alertEvento.mostrarCuadro(context, texto:respuestaValidate["msn"]??"",title: "Algo Anda Mal");
      });
     // Navigator.pop(context);
      //Timer(Duration(milliseconds: 200), (){modalError(context);});
    }
    
  }

  dispose(){
    animatedC.close();
  }
  LoginBloc._internal();
}
