import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Bloc/Escala-Select-Bloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Bloc/Escalas-Bloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Modals/description.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Bloc/ProgramBloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Utils/Internet.dart';

class DestinosEnvService {
   ScalaSelectBloc escalasSelectBloc = ScalaSelectBloc();
   EscalasBloc escala = EscalasBloc();
  senCantidadDescripcion(
    {
      required String idesc,
      required String destino,
      required String descripcion,
      required String cantidadPaquetes,
      required String cantidadguia,
      required String idterm,
      required String ordencant
    }
  )async{
    Map<String,dynamic> body = {
      "id_esc":idesc,
      "destino":destino,
      "cantidadOrden":ordencant,
      "idTErm":idterm,
      "cantidadPaquetes":cantidadPaquetes,
      "cantidadGuias":cantidadguia,
      "descripcion":descripcion
 
    };
    String url = "http://avatar.shalom.com.pe/servicechoferesapp/regis_desc_cant_escala";
    print("Peteicion---->sendCantidadDescripcion");
    print("Send Body-->$body");
    var response = await Internet.httpPost(url: url, body: body, seconds: 2);
    print("Respuesta---->$response");
    if(response["valor"]==1){
      escalasSelectBloc.trySerRegSalida.sink.add(1);
    }else{
      escalasSelectBloc.trySerRegSalida.sink.add(2);
    }
    return response;
  }



    listOfCantidades(
    {
       String salidaCA="",
    }
  )async{
    Map<String,dynamic> body = {
      "salidaCA":ProgramacionBloc.getIdcar.toString()
     };
    String url = "http://shalomcontrol.com/shalomprodapp/query/embarque_ordenes_por_destino";
    print("Peteicion---->listofCantidades");
    print("Send Body-->$body");
    var response = await Internet.httpPost(url: url, body: body, seconds: 2);
    print("Respuesta---->$response");
    return response;
  }
      listdescOfCantidades(
    {
       String idesc="",
    }
  )async{
    List<Description> desc = [];
    Map<String,dynamic> body = {
      "id_esc":escalasSelectBloc.getIdesc ==  "" ? escala.escala.idEsc: escalasSelectBloc.getIdesc,
     };
    String url = "http://avatar.shalom.com.pe/servicechoferesapp/list_desc_cant_escala";
    print("Peteicion---->listofCantidades");
    print("Send Body-->$body");
    var response = await Internet.httpPost(url: url, body: body, seconds: 2);
    print("Respuesta---->$response");
    if(response["valor"]==1){
      for (var item in response["data"]) {
        Description descrip = Description.fromJson(item);
        desc.add(descrip);
      }
    }
    return desc;
  }
}

