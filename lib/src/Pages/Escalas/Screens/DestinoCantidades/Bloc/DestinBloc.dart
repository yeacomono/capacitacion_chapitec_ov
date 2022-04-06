import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Modals/DestinoCarguero.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Modals/description.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Screens/DestinoCantidades/DestinoCantidades.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Services/Escalas-Destino.dart';

class DestinoCantBloc{
  static final DestinoCantBloc _instance =  DestinoCantBloc._internal();
  factory DestinoCantBloc(){
    return _instance;
  }
  DestinosEnvService destinosEnvService = DestinosEnvService();
  List<String> listdestinos = []; 
  List<Description> description =[];
  set setDestino(List<String>i){
     listdestinos = i;
  }
  get getDestino{
    return listdestinos;
  }
  Stream<List<DestCards>>listodDestinos()async*{
    var datadesc = await DestinoEnvio.destinosEnvService.listdescOfCantidades();
    description = datadesc;
    List<DestCards> data  = [];
   var response =  await destinosEnvService.listOfCantidades();
    for (var item in response["data"]) {
      DestCards card =  DestCards.fromJson(item);
      data.add(card);
    }
    yield data;
  }
  DestinoCantBloc._internal();
}