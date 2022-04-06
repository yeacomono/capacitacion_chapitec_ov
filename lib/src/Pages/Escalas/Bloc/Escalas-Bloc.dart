
import 'dart:async';

import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Modals/EscalaModel.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Services/Escalas-Service.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Bloc/ProgramBloc.dart';

class EscalasBloc{
 static String  _nameEscala = "Escalas";
 static int     _bloqEscala = 0;
 static int     idEscala = 0;
 static int     largolista = 0;

 static final EscalasBloc _instance = EscalasBloc._internal();
 EscalaModelCard escala = EscalaModelCard();
  factory EscalasBloc() {
    //print("Constructor iniciado");
    //callServiceEscala();
    return _instance;
  }

  static StreamController<List<EscalaModelCard>> _escalasController = StreamController<List<EscalaModelCard>>.broadcast();
  static Stream<List<EscalaModelCard>> get escalasStream {
    streamListOfEscalas();
    return _escalasController.stream;
    }
   
  dispose() => _escalasController.close();

  static  streamListOfEscalas()async{
      List<EscalaModelCard> list = await callServiceEscala();
      _escalasController.sink.add(list);
      print("Escuchando");
      print(_escalasController.hasListener);
  }

  static callServiceEscala()async{
    List<EscalaModelCard> listOfEscalas=[];
    var response = await EescalasService.requestEscalaService(ProgramacionBloc.getIdcar.toString());
    if(response['valor']==1){
       for (var item in response["data"]) {
          var escalacard = EscalaModelCard.fromJson(item);
          listOfEscalas.add(escalacard);
       }
     }
    return listOfEscalas;
   }

  static set setnameEscala(String i){
     _nameEscala = i;
   }
  static get getnameEscala{
    return _nameEscala;
  }
    static set setbloqEscala(int i){
     _bloqEscala = i;
   }
  static get getbloqEscala{
    return _bloqEscala;
  }
  EscalasBloc._internal();
}