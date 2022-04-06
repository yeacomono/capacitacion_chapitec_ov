import 'dart:async';

class ScalaSelectBloc {
  static final ScalaSelectBloc _instance = ScalaSelectBloc._internal();
  factory ScalaSelectBloc() {
    return _instance;
  }
  String fechaL = "";
  String fechaS = "";
  String fechaIE = "";
  String fechaLEE = "";
  String fechaLID = "";
  String fechaLED = "";

  String descripcion = "";

  bool  unlockProc = true;

  //changeboton llega4da
  StreamController<bool> changeLLegada = StreamController<bool>.broadcast();
  Stream<bool> get sLLegada => changeLLegada.stream;

  StreamController<bool> changeShaldia = StreamController<bool>.broadcast();
  Stream<bool> get sShaldia => changeShaldia.stream;

  StreamController<bool> changeInitEmbarque =
      StreamController<bool>.broadcast();
  Stream<bool> get schangeInitEmbarque => changeInitEmbarque.stream;

  StreamController<bool> changeEndEmbarque = StreamController<bool>.broadcast();
  Stream<bool> get schangeEndEmbarque => changeEndEmbarque.stream;

  StreamController<bool> chaninidesembarque =
      StreamController<bool>.broadcast();
  Stream<bool> get schaninidesembarque => chaninidesembarque.stream;

  StreamController<bool> chngeEndDesembarque =
      StreamController<bool>.broadcast();
  Stream<bool> get schngeEndDesembarque => chngeEndDesembarque.stream;

  void dispose() {
    changeLLegada.close();
    changeShaldia.close();
    changeInitEmbarque.close();
    chngeEndDesembarque.close();
    chaninidesembarque.close();
    changeEndEmbarque.close();
  }

  StreamController<int> trySerRegSalida = StreamController.broadcast();
  Stream<int> get serRegSalida => trySerRegSalida.stream;
  StreamController<String> msnvalidation = StreamController<String>.broadcast();
  Stream<String> get smsnvalidation => msnvalidation.stream;

  StreamController<String> selectCargo = StreamController<String>.broadcast();
  Stream<String> get sselectCargo => selectCargo.stream;

  disposeStreams() {
    trySerRegSalida.close();
    msnvalidation.close();
    selectCargo.close();
  }

  //Botnes de bloqueo

  bool initembarque    = false;
  bool endembarque     = false;
  bool initdesembarque = false;
  bool enddesembarque  = false;
  bool llegada         = false;
  bool salida          = false;

  bool solicitarConformidad = true;

  restoreBotonStado() {
   initembarque    = false;
   endembarque     = false;
   initdesembarque = false;
   enddesembarque  = false;
   llegada         = false;
   salida          = false;
  }

  printBotonesEstado(){
    
    print("/////////////////////Botones Estado////////////////////////////");
    print("initembarque $initembarque");
    print("endembarque $endembarque");
    print("initdesembarque $initdesembarque");
    print("enddesembarque $enddesembarque");
    print("llegada $llegada");
    print("salida $salida");
    print("/////////////////////Botones Estado//////////////////////");
  }
  
  //Botnes de bloqueo
  String _idesc = "";


  ///Valores de Cargo

  bool _bolsas = false;
  bool _guias = false;
  bool _giros = false;
  bool _paqueterias = false;
  resetCargoValores() {
    _bolsas = false;
    _guias = false;
    _giros = false;
    _paqueterias = false;
  }

  ///Valores de Cargo
  int indexbloc = 0;

  int indexEnd = 0;

  ///////////////////////////////////////////////////////
  set setIdesc(String i) {_idesc = i;}
  get getIdesc{return _idesc;}
  //////////////BoxSelectCargoVariable////////////////
  set setGuias(bool i){_guias = i;}
  get getGuias {return _guias;}
  set setbolsas(bool i) {_bolsas = i;}
  get getbolsas {return _bolsas;}
  set setgiros(bool i) {_giros = i;}
  get getgiros {return _giros;}
  set setpaqueterias(bool i){_paqueterias = i;}
  get getpaqueterias {return _paqueterias;}
//////////////BoxSelectCargoVariable////////////////////

  ScalaSelectBloc._internal();
}
