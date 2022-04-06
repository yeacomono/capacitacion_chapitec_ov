
import 'package:capacitacion_flutter_gran_chapo/src/Utils/Internet.dart';

abstract class PerfilService{
  static String urlChangePassword = "http://avatar.shalom.com.pe/servicechoferesapp/create_update_password";
//////////////////////////////Service////////////////////////////////////////////// validate_user
  static Future serviceValidateUser({required Map<String,dynamic> body})async{
    print("Consultado Servicio -->serciveValidateUser");
    print("enviando datos  ---> $body");
    var response = await Internet.httpPost(url: urlChangePassword, body: body, seconds: 1);
    print('Impriendo resultado $response');
//////////////////////////////ServiceEnd//////////////////////////////////////////////    
    return response;
  }

}