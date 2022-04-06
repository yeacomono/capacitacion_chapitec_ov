class Userrelevo {
  String?  idchofer;
  String?  nombre;
  String?  lugar;
  String?  fecha;
  String?  hora;

  Userrelevo(
      {
        this.idchofer,
        this.nombre,
        this.lugar,
        this.fecha,
        this.hora
      }
  );
  Userrelevo.fromJson(Map<String, dynamic> json) {
    idchofer = json["id_chofer"];
    nombre = json["nombre"];
    lugar = json['lugar'];
    fecha = json['fecha'];
    hora = json['hora'];
  }

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_chofer']  = this.idchofer;
    data['nombre']          = this.nombre;
    data['lugar']        = this.lugar;
    data['fecha']         = this.fecha;
    data['hora']         = this.hora;
    return data;

  }
}