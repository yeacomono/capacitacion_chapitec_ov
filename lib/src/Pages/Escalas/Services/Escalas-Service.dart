import 'package:capacitacion_flutter_gran_chapo/src/Utils/Internet.dart';

class  EescalasService {
 static requestEscalaService(String idcargrupo)async{
    Map<String,dynamic> body = {
      "id_car_grupo":idcargrupo
    };
    String url = "http://avatar.shalom.com.pe/servicechoferesapp/progra_escala";
    print("Peteicion---->requestEscalaService");
    print("Send Body-->$body");
    var response = await Internet.httpPost(url: url, body: body, seconds: 2);
    print("Respuesta---->$response");
    return response;
  }
}