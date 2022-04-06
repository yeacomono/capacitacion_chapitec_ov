import 'dart:async';

import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Models/Card-Programacion.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Services/Program-Service.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Singleton/LoginUser.dart';
LoginUser loginUser =  LoginUser();
 class  ProgramacionBloc {
   static final now = new DateTime.now();
  static final ProgramacionBloc _instance = new ProgramacionBloc._internal();
  factory ProgramacionBloc(){
    return _instance;
  }
  ProgramService programService = ProgramService();

  static String rutaname        = "RUTANAME";
  static String idcargroup      = "000000";
  static String choferOne       = "sinDni1";
  static String choferTwo       = "sinDNi2";
  static String choferInicial   = "72735306"; 
  static String choferFinal     = "72735306";
  static bool Completado = true;
  static String fechaFin ='$now';
  static EstadoRuta estadoRutta =  EstadoRuta();
  
  static bool bloqProcess = false; 

  StreamController<List<Programacion>> _programacionController =  StreamController<List<Programacion>>.broadcast();
  Stream<List<Programacion>> get programacion{ 
    callService();
    return  _programacionController.stream;
    }

  dispose(){
    _programacionController.close();
  }
   
  resetallValues(){
    rutaname        = "RUTANAME";
    idcargroup      =  "000000"; 
  }
  callService() async{
     //   print("${loginUser.userData.choferOne!.dni}");
    Map<String,dynamic> body = {
      "user_chofer":"${loginUser.userData.choferOne?.dni}"
     //"user_chofer":"42184845"
    }; 
    var response = await programService.requestListOfPrograms(body: body, seconds: 0);
    if(response["valor"]==1){
      List<Programacion> lisprograms = [];
      //print("constructor iniciado ");
      for (var item in response["data"]) {
         Programacion programacion = Programacion.fromJson(item);
         lisprograms.add(programacion);
      }
      _programacionController.sink.add(lisprograms);
     print("ewewewe${ _programacionController.hasListener}");
     return response;
    }
  }
  
 static Stream<String> get getRutaProgramacion async*{
    String nameRutaProgramacion = rutaname ;
    yield nameRutaProgramacion;
  }
 static set setRutaName(String i){
    rutaname = i;
 }

 static set setIdcar(String i){
   idcargroup = i;
 }
  static set setChoferOne(String i){
   choferOne = i;
 }
  static set setChoferTwo(String i){
   choferTwo = i;
 }
 static set setCompletado(bool i){
   Completado = i;
 }
 static set setFechaFin(String i){
   fechaFin = i;
 }

 static get getFechaFin   { return fechaFin;   }
 static get getCompletado { return Completado; }
 static get getIdcar      { return idcargroup; }
 static get getChoferOne  { return idcargroup; }
 static get getChoferTwo  { return idcargroup; }

 
 ProgramacionBloc._internal();
}