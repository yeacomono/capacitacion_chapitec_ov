import 'package:capacitacion_flutter_gran_chapo/src/Pages/Login/Models/UserData.dart';

class Programacion {
  String?       idcarGrupo;
  String?       ruta;
  String?       origen;
  String?       destino;
  String?       choferOne;
  String?       choferTwo;
  String?       fecha;
  String?       placa;
  String?       codigo;
  List<String>? destinosNombre;
  EstadoRuta?   estadoRuta;
  int?          estado;


  Programacion(
      {

      this.ruta,
      this.origen,
      this.destino,
      this.choferOne,
      this.choferTwo,
      this.fecha,
      this.placa,
      this.codigo,
      this.idcarGrupo,
      this.destinosNombre,
      this.estadoRuta,
      this.estado,
      }
  );
  Programacion.fromJson(Map<String, dynamic> json) {
    destinosNombre = json["destinosNombre"].cast<String>();
    idcarGrupo = json["id_car_grupo"];
    ruta = json['ruta'];
    origen = json['origen'];
    destino = json['destino'];
    choferOne = json['chofer_one'];
    choferTwo = json['chofer_two'];
    fecha = json['fecha'];
    placa = json['placa'];
    codigo = json['codigo'];
    estadoRuta = json['estado_ruta'].length!=0?json['estado_ruta'][0]!=null ?EstadoRuta.fromJson( json['estado_ruta'][0]):null:null;
    estado = json["estado"];
  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_car_grupo']   = this.idcarGrupo;
    data['ruta']           = this.ruta;
    data['origen']         = this.origen;
    data['destino']        = this.destino;
    data['chofer_one']     = this.choferOne;
    data['chofer_two']     = this.choferTwo;
    data['fecha']          = this.fecha;
    data['placa']          = this.placa;
    data['codigo']         = this.codigo;
    data['destinosNombre'] = this.destinosNombre;
    data['estado']         = this.estado;
    return data;    
  }

}


class EstadoRuta {
  String? id;
  String? choferInicial;
  String? choferFinal;
  String? chofer1Init;
  String? chofer2Init;
  String? fechaInit;
  String? kilometrajeInit;
  String? candadosInit;
  String? chofer1Arrive;
  String? chofer2Arrive;
  String? fechaArrive;
  String? kilometrajeArrive;
  String? candadosArrive;
  String? estado;

  EstadoRuta(
      {
      this.id,
      this.choferInicial,
      this.choferFinal,
      this.chofer1Init,
      this.chofer2Init,
      this.fechaInit,
      this.kilometrajeInit,
      this.candadosInit,
      this.chofer1Arrive,
      this.chofer2Arrive,
      this.fechaArrive,
      this.kilometrajeArrive,
      this.candadosArrive,
      this.estado});

  EstadoRuta.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chofer1Init = json['chofer1_init'];
    chofer2Init = json['chofer2_init'];
    fechaInit = json['fecha_init'];
    kilometrajeInit = json['kilometraje_init'];
    candadosInit = json['candados_init'];
    chofer1Arrive = json['chofer1_arrive'];
    chofer2Arrive = json['chofer2_arrive'];
    fechaArrive = json['fecha_arrive'];
    kilometrajeArrive = json['kilometraje_arrive'];
    candadosArrive = json['candados_arrive'];
    estado = json['estado'];
    choferInicial = json['chofer_inicial'];
    choferFinal = json['chofer_final'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chofer1_init'] = this.chofer1Init;
    data['chofer2_init'] = this.chofer2Init;
    data['fecha_init'] = this.fechaInit;
    data['kilometraje_init'] = this.kilometrajeInit;
    data['candados_init'] = this.candadosInit;
    data['chofer1_arrive'] = this.chofer1Arrive;
    data['chofer2_arrive'] = this.chofer2Arrive;
    data['fecha_arrive'] = this.fechaArrive;
    data['kilometraje_arrive'] = this.kilometrajeArrive;
    data['candados_arrive'] = this.candadosArrive;
    data['estado'] = this.estado;
    data['chofer_inicial'] = this.choferInicial;
    data['chofer_final'] = this.choferFinal;
    return data;
  }
}
