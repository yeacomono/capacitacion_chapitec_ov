import 'package:capacitacion_flutter_gran_chapo/src/Pages/Login/Models/UserData.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Bloc/ProgramBloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Singleton/LoginUser.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Utils/Internet.dart';

class RelevosService {
  LoginUser loginUser= LoginUser();
  UserData userData = UserData();
  
  // Registrar relevo
  Future<dynamic> serviceRegisterRelevos(String place)async{
    var now = new DateTime.now();
    String fecha = "${now.year}-${now.month}-${now.day}";
    String hora  = "${now.hour}:${now.minute}:${now.second}";
    String url = "http://avatar.shalom.com.pe/servicechoferesapp/regis_relevo";
    Map<String,dynamic> body = {
      "user_chofer": loginUser.userData.user??'123456',
      "id_car_grupo":ProgramacionBloc.getIdcar,
      "lugar_rel":place,
      "fecha_rel":fecha,
      "hora_rel":hora      
    };
    print("Iniciando--->serviceRegisterRelevos");
    print("Send-Body--->$body");
    var response = await Internet.httpPost(url: url, body: body, seconds: 2);
    print("Respuesta--->$response");
    return response;

  }
  // Listar relevos
  Future<dynamic> serviceListRelevos()async{
    String url = "http://avatar.shalom.com.pe/servicechoferesapp/list_relevos";
    Map<String,dynamic> body = {
      "id_car_grupo":ProgramacionBloc.getIdcar,    
    };
    print("Iniciando--->serviceListRelevos");
    print("Send-Body--->$body");
    var response = await Internet.httpPost(url: url, body: body, seconds: 2);
    print("Respuesta--->$response");
    return response;

  }
}