import 'package:capacitacion_flutter_gran_chapo/src/Utils/Internet.dart';

class ProgramService{
  requestListOfPrograms({required Map<String,dynamic> body,required int seconds})async{
    String url = "http://avatar.shalom.com.pe/servicechoferesapp/progra_carguero";
    print('Service--->requestListOfPrograms');
    print("Send Body---->$body");
    var responsive = await Internet.httpPost(url: url, body: body, seconds: seconds);
    print('Respuesta---> ${responsive}');
    return responsive;
  }
}