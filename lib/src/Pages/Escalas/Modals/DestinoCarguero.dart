class DestCards {
  String? name;
  String? idTErm;
  String? cantidadOrden;
  String? cantidadPaquetes;
  String? cantidadGuias;
  String? dCarguero;

  DestCards(
      {this.name,
      this.idTErm,
      this.cantidadOrden,
      this.cantidadPaquetes,
      this.cantidadGuias,
      this.dCarguero});

  DestCards.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    idTErm = json['idTErm'];
    cantidadOrden = json['cantidadOrden'];
    cantidadPaquetes = json['cantidadPaquetes'];
    cantidadGuias = json['cantidadGuias'];
    dCarguero = json['dCarguero'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['idTErm'] = this.idTErm;
    data['cantidadOrden'] = this.cantidadOrden;
    data['cantidadPaquetes'] = this.cantidadPaquetes;
    data['cantidadGuias'] = this.cantidadGuias;
    data['dCarguero'] = this.dCarguero;
    return data;
  }
}
