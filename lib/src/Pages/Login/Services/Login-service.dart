
import 'package:capacitacion_flutter_gran_chapo/src/Utils/Internet.dart';

abstract class LoginService{
  static String urlValidateUser = "http://avatar.shalom.com.pe/servicechoferesapp/validate_user";
  static String urlChoferesLogin = "http://avatar.shalom.com.pe/servicechoferesapp/choferes_login";
//////////////////////////////Service////////////////////////////////////////////// validate_user
  static Future serviceValidateUser({required Map<String,dynamic> body})async{
    print("Consultado Servicio -->serciveValidateUser");
    print("enviando datos  ---> $body");
    var response = await Internet.httpPost(url: urlValidateUser, body: body, seconds: 1);
    print('Impriendo resultado $response');
//////////////////////////////ServiceEnd//////////////////////////////////////////////    
    return response;
  }

  static Future serviceLogin({required Map<String,dynamic> body})async{
    print("Consultado Servicio -->serviceLogin");
    print("enviando datos ---> $body");
    var response = await Internet.httpPost(url: urlChoferesLogin, body: body, seconds: 1);
    print('Impriendo resultado $response');
//////////////////////////////ServiceEnd//////////////////////////////////////////////    
    return response;
  }

}