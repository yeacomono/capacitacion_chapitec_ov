import 'dart:async';


import 'package:capacitacion_flutter_gran_chapo/src/Pages/Gastos/Models/user-Relevo.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Gastos/Services/Relevos-Service.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Relevos/Models/user-Relevo.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Relevos/Services/Relevos-Service.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Singleton/LoginUser.dart';
LoginUser loginUser =  LoginUser();
 class  GastosBloc {
  
  GastosService gastosService = GastosService();
  static String selecOption = "Combustible";
  GastosBloc.callServiceLimit(){
    callServiceLimit();
  }
  GastosBloc.callService(){
    callService();
  }
  StreamController<List<itemGasto>> _relevoController =  StreamController<List<itemGasto>>.broadcast();
  Stream<List<itemGasto>> get gastos => _relevoController.stream;
  StreamController<List<itemGasto>> _relevoControllerLimit =  StreamController<List<itemGasto>>.broadcast();
  Stream<List<itemGasto>> get gastosLimit => _relevoControllerLimit.stream;
  

  callService() async{

    var response = await gastosService.serviceListGastos();
    if(response["valor"]==1){
      List<itemGasto> lisgastos = [];
      print("constructor iniciado");
      for (var item in response["data"]) {
         itemGasto itemGastos = itemGasto.fromJson(item);
         lisgastos.add(itemGastos);
         
      }
      _relevoController.sink.add(lisgastos);
     print("${ _relevoController.hasListener} emision al stream sin Limit");
    }else{
       _relevoController.sink.add([]);
    }
  }
  callServiceLimit() async{

    var response = await gastosService.serviceListGastosLimit(limit:'2');
    if(response["valor"]==1){
      List<itemGasto> lisgastos = [];
      print("constructor iniciado");
      for (var item in response["data"]) {
         itemGasto itemGastos = itemGasto.fromJson(item);
         lisgastos.add(itemGastos);
      }
      _relevoControllerLimit.sink.add(lisgastos);
     print("${ _relevoControllerLimit.hasListener} emision al stream, con limit");
    }else{
       _relevoControllerLimit.sink.add([]);
    }
  }

  agregarGasto(itemGasto user) async{
    List<itemGasto> listgastos = [user];
    _relevoControllerLimit.sink.add(listgastos);

  }
  dispose(){
    _relevoControllerLimit.close();
    _relevoController.close();
  }
}