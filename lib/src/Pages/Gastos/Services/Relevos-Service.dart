import 'dart:convert';
import 'dart:io';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Bloc/Escala-Select-Bloc.dart';
import 'package:dio/dio.dart';
import 'package:path/path.Dart';
import 'package:async/async.Dart';
import 'Dart:io';
import 'package:http/http.Dart' as http;
import 'Dart:convert';

import 'package:capacitacion_flutter_gran_chapo/src/Pages/Login/Models/UserData.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Bloc/ProgramBloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Singleton/LoginUser.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Utils/Internet.dart';

class GastosService {
  LoginUser loginUser= LoginUser();
  UserData userData = UserData();
  ScalaSelectBloc scalaSelectBloc =  ScalaSelectBloc();
  
  // Registrar relevo
  Future<dynamic> serviceRegisterRelevos(
  {
    required String? file, 
    required String observ,
    required String monto,
    required String ruc,
    required String fhfact,
    required String numdoc,
    required String serie,
    required String tipodoc,
    required String tipogasto
  }
  )async{
    var now = new DateTime.now();
    String fecha = "${now.year}-${now.month}-${now.day}";
    String hora  = "${now.hour}:${now.minute}:${now.second}";
    String url = "http://avatar.shalom.com.pe/servicechoferesapp/regis_gastos";
    Map<String,dynamic> body = {
      "user_chofer": loginUser.userData.user??'123456',
      "id_car_grupo":ProgramacionBloc.getIdcar,
      "tipo_gasto":tipogasto,
      "tipo_doc":tipodoc,
      "serie":serie,
      "num_doc":numdoc,
      "fh_fact":fhfact,
      "ruc":ruc,
      "monto":monto,
      "observ":observ,
      "fecha_rel":fecha,
      "hora_rel":hora,
      "foto_comp":file, 
    };
    print("Iniciando--->serviceRegisterGastos");
    print("Send-Body--->$body");
    var response = await Internet.httpPost(url: url, body: body, seconds: 2);
    print("Respuesta--->$response");
    if(response["valor"]==1){
     scalaSelectBloc.trySerRegSalida.sink.add(1);
    }else{
     scalaSelectBloc.trySerRegSalida.sink.add(2);
    }
    return response;

  }
  // Listar relevos con lomite
  Future<dynamic> serviceListGastosLimit({required String limit})async{
    String url = "http://avatar.shalom.com.pe/servicechoferesapp/list_gastos";
    Map<String,dynamic> body = {
      "limit":limit,
      "id_car_grupo":ProgramacionBloc.getIdcar,

    };
    print("Iniciando--->serviceListGastosLimit");
    print("Send-Body--->$body");
    var response = await Internet.httpPost(url: url, body: body, seconds: 2);
    print("Respuesta--->$response");
    return response;

  }

  Future<dynamic> serviceListGastos()async{
    String url = "http://avatar.shalom.com.pe/servicechoferesapp/list_gastos";
    Map<String,dynamic> body = {
      "id_car_grupo":ProgramacionBloc.getIdcar,

    };
    print("Iniciando--->serviceListGastos");
    print("Send-Body--->$body");
    var response = await Internet.httpPost(url: url, body: body, seconds: 2);
    print("Respuesta--->$response");
    return response;

  }

  Future<dynamic> serviceUploadPhoto({required File file})async{
    String url = "https://fileserver.shalomcontrol.com/api/file";

    //var MyFile = await MultipartFile.fromPath(file.path, file.path);
    Map<String,dynamic> body = {      
      "files":file,

    };
    print("Iniciando--->serviceUploadPhoto");
    print("Send-Body--->$body");
    var response = await Internet.httpFile(url: url,file: await MultipartFile.fromFile(file.path,filename: file.path));
    //var response = upload(file);
    print("Respuesta--->$response");
    return 'https://fileserver.shalomcontrol.com/file-view/'+response;

  }

  upload(File imageFile) async {
      // open a bytestream
      var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      // get file length
      var length = await imageFile.length();
      // string to uri
      var uri = Uri.parse("https://fileserver.shalomcontrol.com/api/file-new2");
      // create multipart request
      var request = new http.MultipartRequest("POST", uri);
      // multipart that takes file
      var multipartFile = new http.MultipartFile('file', stream, length,
          filename: basename(imageFile.path));
      // add file to multipart
      request.files.add(multipartFile);
      // send
      var response = await request.send();
      print(response.statusCode);
      print(response);
      // listen for response
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });
    }
}