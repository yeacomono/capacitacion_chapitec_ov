

import 'package:capacitacion_flutter_gran_chapo/src/Mixins/AlertsMixin.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Bloc/Escala-Select-Bloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Utils/Internet.dart';
import 'package:flutter/cupertino.dart';

class EscalaDetailsService with AlertsMixin {
  ScalaSelectBloc scalaSelectBloc =  ScalaSelectBloc();
  registerllegada(
    {
      required String kilometraje,
      required String idcargrupo,
      required String nombreesc
    }
    ) async {
      /////////////////////////////////////////////////////////////////////////////////////
    var now = new DateTime.now();
    String fecha = "${now.year}-${now.month}-${now.day}";
    String hora  = "${now.hour}:${now.minute}:${now.second}";
    print("Servicio---->registerllegada");
    String url = "http://avatar.shalom.com.pe/servicechoferesapp/regis_lleg_sal_escala";
    Map<String, dynamic> body = {
      "id_car_grupo" :idcargrupo,
      "km_llegada"   :kilometraje,
      "nombre_esc"   :nombreesc,
      "fecha_llegada":fecha,
      "hora_llegada" :hora
    };
    print("Send-Body----->$body");
    var response = await Internet.httpPost(url: url, body: body, seconds: 2);
    
    print("Respuesta--->$response");
    /////////////////////////////////////////////////////////////////////////////////////
    if(response["valor"]==1){
      scalaSelectBloc.msnvalidation.sink.add(response["msn"]);
      scalaSelectBloc.trySerRegSalida.sink.add(1);
      scalaSelectBloc.setIdesc = response["data"]["id_esc"];
      scalaSelectBloc.fechaL = "$fecha $hora";
      scalaSelectBloc.changeLLegada.sink.add(false);
      print("haslistener${scalaSelectBloc.changeLLegada.hasListener}");
      
    }else{
      scalaSelectBloc.msnvalidation.sink.add(response["msn"]);
    }
    ////////////////////////////////////////////////////////////////////////////////////////
    return response;
  }

  registersalida(
    {
      required String nombreesc,
      required String idcargrupo,
      required String kilometraje,
      required String idesc
    }
  ) async {
    /////////////////////////////////////////////////////////////////////////////////////
    var now = new DateTime.now();
    String fecha = "${now.year}-${now.month}-${now.day}";
    String hora  = "${now.hour}:${now.minute}:${now.second}";
    String url = "http://avatar.shalom.com.pe/servicechoferesapp/regis_lleg_sal_escala";
    print("Servicio---->registerSalida");
    Map<String, dynamic> body = {
      "nombre_esc"   :nombreesc,
      "id_car_grupo" :idcargrupo,
      "id_esc"       :idesc,
      "km_salida"   :kilometraje,
      "fecha_salida":fecha,
      "hora_salida" :hora
    };
    print("Send Body ---->$body");
    var response = await Internet.httpPost(url: url, body: body, seconds: 2);

    /////////////////////////////////////////////////////////////////////////////////////
      if(scalaSelectBloc.getIdesc==""){
      
      }
    if(response["valor"]==1){
      scalaSelectBloc.setIdesc = response["data"]["id_esc"];
      scalaSelectBloc.msnvalidation.sink.add(response["msn"]);
      scalaSelectBloc.trySerRegSalida.sink.add(1);
      print("ffefe-->${scalaSelectBloc.trySerRegSalida}");
      scalaSelectBloc.changeShaldia.sink.add(false);
      scalaSelectBloc.fechaS = "$fecha $hora";
    }else if(response["valor"]==0){
      scalaSelectBloc.msnvalidation.sink.add(response["msn"]);
      scalaSelectBloc.trySerRegSalida.sink.add(2);
    }
    print("Respuesta--->$response");
    /////////////////////////////////////////////////////////////////////////////////////
    return response;
  }

  initEmbarque(String idesc) async {
    /////////////////////////////////////////////////////////////////////////////////////
    var now = new DateTime.now();
    String fecha = "${now.year}-${now.month}-${now.day}";
    String hora  = "${now.hour}:${now.minute}:${now.second}";
    String url = "http://avatar.shalom.com.pe/servicechoferesapp/regis_emb_desmb_escala";
    print("Servicio---->initEmbarque");
    Map<String, dynamic> body = {
      "fecha_embarque_ini":fecha,
      "hora_embarque_ini":hora,
      "id_esc":idesc
    };
    print("Send Body ---->$body");
    var response = await Internet.httpPost(url: url, body: body, seconds: 2);
    print("Respuesta--->$response");
    /////////////////////////////////////////////////////////////////////////////////////
    if(response["valor"]==1){
      scalaSelectBloc.msnvalidation.sink.add(response["msn"]);
      scalaSelectBloc.trySerRegSalida.sink.add(1);
      scalaSelectBloc.changeInitEmbarque.sink.add(false);
      scalaSelectBloc.fechaIE = "$fecha $hora";
    }else{
       scalaSelectBloc.trySerRegSalida.sink.add(2);
      scalaSelectBloc.msnvalidation.sink.add(response["msn"]);
    }
    ////////////////////////////////////////////////////////////////////////////////////////
    return response;
  }

  endEmbarque(String idesc) async {
    /////////////////////////////////////////////////////////////////////////////////////
    var now = new DateTime.now();
    String fecha = "${now.year}-${now.month}-${now.day}";
    String hora  = "${now.hour}:${now.minute}:${now.second}";
    String url = "http://avatar.shalom.com.pe/servicechoferesapp/regis_emb_desmb_escala";
    print("Servicio---->endEembarque");
    Map<String, dynamic> body = {
      "fecha_embarque_fin":fecha,
      "hora_embarque_fin":hora,
      "id_esc":idesc
    };
    print("Send Body ---->$body");
    var response = await Internet.httpPost(url: url, body: body, seconds: 2);
    print("Respuesta--->$response");
    /////////////////////////////////////////////////////////////////////////////////////
    if(response["valor"]==1){
      scalaSelectBloc.msnvalidation.sink.add(response["msn"]);
      scalaSelectBloc.trySerRegSalida.sink.add(1);
      scalaSelectBloc.changeEndEmbarque.sink.add(false);
      scalaSelectBloc.fechaLEE = "$fecha $hora";
    }else{
       scalaSelectBloc.trySerRegSalida.sink.add(2);
      scalaSelectBloc.msnvalidation.sink.add(response["msn"]);
    }
    ////////////////////////////////////////////////////////////////////////////////////////
    return response;
  }

  initDesembarque(String idesc) async {
    var now = new DateTime.now();
    String fecha = "${now.year}-${now.month}-${now.day}";
    String hora  = "${now.hour}:${now.minute}:${now.second}";
    String url = "http://avatar.shalom.com.pe/servicechoferesapp/regis_emb_desmb_escala";
    print("Servicio---->initDesembarque");
    Map<String, dynamic> body = {
      "fecha_desembarque_ini":fecha,
      "hora_desembarque_ini":hora,
      "id_esc":idesc
    };
    print("Send Body ---->$body");
    var response = await Internet.httpPost(url: url, body: body, seconds: 2);
    print("Respuesta--->$response");
     /////////////////////////////////////////////////////////////////////////////////////
    if(response["valor"]==1){
      scalaSelectBloc.trySerRegSalida.sink.add(1);
      scalaSelectBloc.msnvalidation.sink.add(response["msn"]);
      scalaSelectBloc.chaninidesembarque.sink.add(false);
      scalaSelectBloc.fechaLID = "$fecha $hora"; 
    }else{
       scalaSelectBloc.trySerRegSalida.sink.add(2);
      scalaSelectBloc.msnvalidation.sink.add(response["msn"]);
    }
    ////////////////////////////////////////////////////////////////////////////////////////   
    return response;
  }

  endDesmbarque(String idesc) async {
    var now = new DateTime.now();
    String fecha = "${now.year}-${now.month}-${now.day}";
    String hora  = "${now.hour}:${now.minute}:${now.second}";
    String url = "http://avatar.shalom.com.pe/servicechoferesapp/regis_emb_desmb_escala";
    print("Servicio---->endEmbarque");
    Map<String, dynamic> body = {
      "fecha_desembarque_fin":fecha,
      "hora_desembarque_fin":hora,
      "id_esc":idesc
    };
    print("Send Body ---->$body");
    var response = await Internet.httpPost(url: url, body: body, seconds: 2);
    print("Respuesta--->$response");

     /////////////////////////////////////////////////////////////////////////////////////
    if(response["valor"]==1){
      scalaSelectBloc.trySerRegSalida.sink.add(1);
      scalaSelectBloc.msnvalidation.sink.add(response["msn"]);
      scalaSelectBloc.chngeEndDesembarque.sink.add(false);
      scalaSelectBloc.fechaLED = "$fecha $hora";
    }else{
      scalaSelectBloc.trySerRegSalida.sink.add(2);
      scalaSelectBloc.msnvalidation.sink.add(response["msn"]);
    }
    ////////////////////////////////////////////////////////////////////////////////////////   
    return response;
  }
  sendDescriptionAndCargo(
    {
    required BuildContext context,  
    required String idesc, 
    required bool   bolsas, 
    required bool   guias,
    required bool   giros, 
    required bool   paqueterias, 
    required String descripcion
    }
    )async{
   print("Servicio---->sendDescriptionAndCargo");
   String url = "http://avatar.shalom.com.pe/servicechoferesapp/regis_extras_escala";
   Map<String, dynamic> body = {
    "id_esc"         :idesc,
    "bolsas_esc"     :bolsas.toString(),
    "guias_esc"      :guias.toString(),
    "giros_esc"      :giros.toString(),
    "paqueterias_esc":paqueterias.toString(),
    "description_esc":descripcion
   };
   print("Send Body ---->$body");
   var response = await Internet.httpPost(url: url, body: body, seconds: 2);
   print("Respuesta---->$response");
     /////////////////////////////////////////////////////////////////////////////////////
    if(response["valor"]==1){
      alertEvento.mostrarCuadro(context, texto: response["msn"],title: "Solicitar Conformidad");
       scalaSelectBloc.trySerRegSalida.sink.add(1);
     // scalaSelectBloc.resetBloqbotones();
      
    }else{
       scalaSelectBloc.trySerRegSalida.sink.add(2);
    }
    ////////////////////////////////////////////////////////////////////////////////////////  
   return response;
  }
}
