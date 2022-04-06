class  VarProgramacion {

  static final VarProgramacion _instance = VarProgramacion._internal();
  
  static String rutaProgramacion = "...";
  factory VarProgramacion(){

    return _instance;

  }

  VarProgramacion._internal();
}