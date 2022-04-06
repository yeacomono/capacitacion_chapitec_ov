import 'dart:async';


import 'package:capacitacion_flutter_gran_chapo/src/Pages/Relevos/Models/user-Relevo.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Relevos/Services/Relevos-Service.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Singleton/LoginUser.dart';
LoginUser loginUser =  LoginUser();
 class  RelevosBloc {
  
  RelevosService relevosService = RelevosService();

  StreamController<List<Userrelevo>> _relevoController =  StreamController<List<Userrelevo>>.broadcast();
  Stream<List<Userrelevo>> get relevo => _relevoController.stream;
 
   Stream<List<Userrelevo>> get relevoithcallService{
     callService();
     return _relevoController.stream;
   } 


  dispose(){
    _relevoController.close();
  }

  callService() async{

    var response = await relevosService.serviceListRelevos();
    if(response["valor"]==1){
      List<Userrelevo> lisprograms = [];
      print("constructor iniciado");
      for (var item in response["data"]) {
         Userrelevo userRelevo = Userrelevo.fromJson(item);
         lisprograms.add(userRelevo);
      }
      _relevoController.sink.add(lisprograms);
     print("${ _relevoController.hasListener}");
    }
  }

  agregarRelevo(Userrelevo user) async{
    List<Userrelevo> listrelevo = [user];
    _relevoController.sink.add(listrelevo);

  }
}