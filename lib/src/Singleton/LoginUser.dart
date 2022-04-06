import 'package:capacitacion_flutter_gran_chapo/src/Pages/Login/Models/UserData.dart';

class LoginUser {
//Trate de no usar mucho el singleton, solo en pocos casos, Es mejor optar por 
//los Streams
UserData userData = UserData();
static final LoginUser _instance = LoginUser._internal();
 factory LoginUser(){
    return _instance;
  }
  LoginUser._internal();
}