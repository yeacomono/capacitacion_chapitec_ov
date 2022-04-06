class itemGasto {
  String?  id_chofer;
  String?  nombre;
  String?  fecha;
  String?  monto;
  String?  tipo_doc;
  String?  serie;
  String?  num_doc;
  String?  tipo_gasto;
  String?  hora;
  String?  comprobante;


  itemGasto(
      {
        this.id_chofer,
        this.nombre,
        this.fecha,
        this.hora,
        this.comprobante,
        this.monto,
        this.num_doc,
        this.serie,
        this.tipo_doc,
        this.tipo_gasto,
      }
  );
  itemGasto.fromJson(Map<String, dynamic> json) {
    id_chofer    = json["id_chofer"];
    nombre       = json["nombre"];
    fecha        = json['fecha'];
    hora         = json['hora'];
    comprobante  = json['comprobante'];
    monto        = json['monto'];
    num_doc      = json['num_doc'];
    serie        = json['serie'];
    tipo_doc     = json['tipo_doc'];
    tipo_gasto   = json['tipo_gasto'];
  }

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_chofer']    = this.id_chofer;
    data['nombre']       = this.nombre;
    data['fecha']        = this.fecha;
    data['hora']         = this.hora;
    data['comprobante']  = this.comprobante;
    data['monto']        = this.monto;
    data['num_doc']      = this.num_doc;
    data['serie']        = this.serie;
    data['tipo_doc']     = this.tipo_doc;
    data['tipo_gasto']   = this.tipo_gasto;
    return data;

  }
}