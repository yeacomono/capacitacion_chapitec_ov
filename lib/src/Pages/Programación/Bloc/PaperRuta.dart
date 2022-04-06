import 'dart:async';

class PaperRutaBLoc{
static final  PaperRutaBLoc _instance = PaperRutaBLoc._internal();
factory PaperRutaBLoc(){
  return _instance;
}


String? idGenInitRuta;

//////////Boton LLegada Ruta /////////////////
StreamController<bool> _botonLlegadaRuta =  StreamController<bool>.broadcast();
Stream<bool> get botonLlegadaRuta => _botonLlegadaRuta.stream;
addStreamBtnLLega(bool data){
  _botonLlegadaRuta.sink.add(data);
}
void dispose(){
  _botonLlegadaRuta.close();
}
//////////Boton LLegada Ruta /////////////////

//Botones estado de bloqueo
bool initRuta = true;
bool endRuta  = false;
//Botones estado de bloqueo
resetBtnEstado(){
  initRuta = true;
  endRuta  = false;
}

resetAll(){

  _botonLlegadaRuta.sink.add(false);
   initRuta = true;

}

PaperRutaBLoc._internal();
}