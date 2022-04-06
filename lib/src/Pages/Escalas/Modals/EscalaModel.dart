class EscalaModelCard {
  String? idEsc;
  String? nombre;
  String? fhLlegada;
  String? fhSalida;
  String? kmLlegada;
  String? kmSalida;
  String? fhEmbIni;
  String? fhEmbFin;
  String? fhDesmbIni;
  String? fhDesmbFin;
  String? isBolsas;
  String? isGuias;
  String? isGiros;
  String? isPaqueterias;
  String? estado;
  String? descripcion;

  EscalaModelCard(
      {this.idEsc,
      this.nombre,
      this.fhLlegada,
      this.fhSalida,
      this.kmLlegada,
      this.kmSalida,
      this.fhEmbIni,
      this.fhEmbFin,
      this.fhDesmbIni,
      this.fhDesmbFin,
      this.isBolsas,
      this.isGuias,
      this.isGiros,
      this.descripcion,
      this.isPaqueterias,
      this.estado});

  EscalaModelCard.fromJson(Map<String, dynamic> json) {
    idEsc = json['id_esc'];
    descripcion = json['descripcion'];
    nombre = json['nombre'];
    fhLlegada = json['fh_llegada'];
    fhSalida = json['fh_salida'];
    kmLlegada = json['km_llegada'];
    kmSalida = json['km_salida'];
    fhEmbIni = json['fh_emb_ini'];
    fhEmbFin = json['fh_emb_fin'];
    fhDesmbIni = json['fh_desmb_ini'];
    fhDesmbFin = json['fh_desmb_fin'];
    isBolsas = json['isBolsas'];
    isGuias = json['isGuias'];
    isGiros = json['isGiros'];
    isPaqueterias = json['isPaqueterias'];
    estado = json['estado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_esc'] = this.idEsc;
    data['nombre'] = this.nombre;
    data['fh_llegada'] = this.fhLlegada;
    data['fh_salida'] = this.fhSalida;
    data['descripcion'] = this.descripcion;
    data['km_llegada'] = this.kmLlegada;
    data['km_salida'] = this.kmSalida;
    data['fh_emb_ini'] = this.fhEmbIni;
    data['fh_emb_fin'] = this.fhEmbFin;
    data['fh_desmb_ini'] = this.fhDesmbIni;
    data['fh_desmb_fin'] = this.fhDesmbFin;
    data['isBolsas'] = this.isBolsas;
    data['isGuias'] = this.isGuias;
    data['isGiros'] = this.isGiros;
    data['isPaqueterias'] = this.isPaqueterias;
    data['estado'] = this.estado;
    return data;
  }
}
