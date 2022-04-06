class Description {
  String? name;
  String? idTErm;
  String? cantidadOrden;
  String? cantidadPaquetes;
  String? cantidadGuias;
  String? idCarguero;
  String? descripcion;

  Description(
      {this.name,
      this.idTErm,
      this.cantidadOrden,
      this.cantidadPaquetes,
      this.cantidadGuias,
      this.idCarguero,
      this.descripcion});

  Description.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    idTErm = json['idTErm'];
    cantidadOrden = json['cantidadOrden'];
    cantidadPaquetes = json['cantidadPaquetes'];
    cantidadGuias = json['cantidadGuias'];
    idCarguero = json['idCarguero'];
    descripcion = json['descripcion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['idTErm'] = this.idTErm;
    data['cantidadOrden'] = this.cantidadOrden;
    data['cantidadPaquetes'] = this.cantidadPaquetes;
    data['cantidadGuias'] = this.cantidadGuias;
    data['idCarguero'] = this.idCarguero;
    data['descripcion'] = this.descripcion;
    return data;
  }
}
