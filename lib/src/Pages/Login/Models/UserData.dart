class UserData {
  String? user;
  ChoferOne? choferOne;
  ChoferOne? choferTwo;
  String? alias     ;
  String? brevete   ;
  String? categoria ;
  String? typeGroup ;
  String? tipoGrupo ;
  String? numCelular;

  UserData(
      {
      this.choferOne,
      this.choferTwo,
      this.alias,
      this.brevete,
      this.categoria ,
      this.typeGroup ,
      this.tipoGrupo ,
      this.numCelular
      }
    );

  UserData.fromJson(Map<String, dynamic> json) {
    choferOne = json['chofer_one'] != null
        ? new ChoferOne.fromJson(json['chofer_one'])
        : null;
    choferTwo = json['chofer_two'] != null
        ? new ChoferOne.fromJson(json['chofer_two'])
        : null;
    alias = json['alias'];
    brevete = json['brevete'];
    categoria = json['categoria'];
    typeGroup = json['typeGroup'];
    tipoGrupo = json['tipoGrupo'];
    numCelular = json['num_celular'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.choferOne != null) {
      data['chofer_one'] = this.choferOne==null?{}:this.choferOne!.toJson();
    }
    if (this.choferTwo != null) {
      data['chofer_two'] = this.choferOne==null?{}:this.choferTwo!.toJson();
    }
    data['alias'] = this.alias;
    data['brevete'] = this.brevete;
    data['categoria'] = this.categoria;
    data['typeGroup'] = this.typeGroup;
    data['tipoGrupo'] = this.tipoGrupo;
    data['num_celular'] = this.numCelular;
    return data;
  }
}

class ChoferOne {
  String? dni ;
  String? primerNombre ;
  String? segundoNombre ;
  String? apellidoMaterno ;
  String? apellidoPaterno ;

  ChoferOne(
      {
      this.dni,
      this.primerNombre,
      this.segundoNombre,
      this.apellidoMaterno,
      this.apellidoPaterno
      }
    );

  ChoferOne.fromJson(Map<String, dynamic> json) {
    dni = json['dni'];
    primerNombre = json['primerNombre'];
    segundoNombre = json['segundoNombre'];
    apellidoMaterno = json['apellidoMaterno'];
    apellidoPaterno = json['apellidoPaterno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dni'] = this.dni;
    data['primerNombre'] = this.primerNombre;
    data['segundoNombre'] = this.segundoNombre;
    data['apellidoMaterno'] = this.apellidoMaterno;
    data['apellidoPaterno'] = this.apellidoPaterno;
    return data;
  }
}