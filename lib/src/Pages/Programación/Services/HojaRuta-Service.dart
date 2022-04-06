
import 'package:capacitacion_flutter_gran_chapo/src/Mixins/AlertsMixin.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Bloc/PaperRuta.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Bloc/ProgramBloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Utils/Internet.dart';
import 'package:flutter/widgets.dart';

class HojaService with AlertsMixin{
 static PaperRutaBLoc _paperRutaBLoc = PaperRutaBLoc();
 static requestGrabarInicioRuta({
    required String ruta,
    required String chofer1,
    required String chofer2,
    required String fecha,
    required String hora,
    required String kilometraje,
    required String candados,
    required String choferInicial,
  })async{

    print("Consultando-->requestGrabarInicioRuta");
    Map<String,dynamic> body={
      "id_car_grupo"     :ProgramacionBloc.idcargroup,
      "ruta"             :ruta,
      "chofer1_init"     :chofer1,
      "chofer2_init"     :chofer2,
      "fecha_init"       :fecha,
      "hora_init"        :hora,
      "kilometraje_init" :kilometraje,
      "candados_init"    :candados,
      "chofer_inicial"   :choferInicial,
    };
    print("Send Body --->$body");
    String url = "http://avatar.shalom.com.pe/servicechoferesapp/progra_ruta";
    var response = await Internet.httpPost(url: url, body: body, seconds: 2);
    print("Respuesta-->$response");


    if(response["valor"]==1){
      _paperRutaBLoc.initRuta = false;

    }

    return response;

  }
   requestGrabarLLegadaRuta({
    required BuildContext context,
    required String ruta,
    required String chofer1,
    required String chofer2,
    required String fecha,
    required String hora,
    required String kilometraje,
    required String candados,
    required String idofInit,
    required String choferfinal,
  })async{

    print("Consultando-->requestGrabarLLegadaRuta");
    
    Map<String,dynamic> body={
      "id"               : idofInit,
      "id_car_grupo"     :ProgramacionBloc.idcargroup,      
      "ruta"             :ruta,
      "chofer1_arrive"     :chofer1,
      "chofer2_arrive"     :chofer2,
      "fecha_arrive"       :fecha,
      "hora_arrive"        :hora,
      "kilometraje_arrive" :kilometraje,
      "candados_arrive"    :candados,
      "chofer_final"       :choferfinal,
    };

     print("Send Body --->$body");
     String url = "http://avatar.shalom.com.pe/servicechoferesapp/progra_ruta";

    var response = await Internet.httpPost(url: url, body: body, seconds: 2);
    if(response["valor"]==1){

     alertEvento.mostrarCuadro(context, texto:response["msn"],title:"LLEGADA RUTA");
     _paperRutaBLoc.addStreamBtnLLega(false);

    }else{

      alertEvento.mostrarCuadro(context, texto:response["msn"],title:"LLEGADA RUTA");
      _paperRutaBLoc.addStreamBtnLLega(true);

    }

    print("Respuesta-->$response");

    return response;

  }
}