import 'package:capacitacion_flutter_gran_chapo/src/Pages/Gastos/Screens/RegistrarGastos-view.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Programaci%C3%B3n/Bloc/ProgramBloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Singleton/LoginUser.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/Input-global-desing.dart';
import 'package:flutter/material.dart';
LoginUser loginUser = LoginUser();
class ListDetailsGastos extends StatefulWidget {
  const ListDetailsGastos({ Key? key }) : super(key: key);

  @override
  _ListDetailsGastosState createState() => _ListDetailsGastosState();
}

class _ListDetailsGastosState extends State<ListDetailsGastos> {
  TextEditingController _inputPassword = new TextEditingController();

 List mapbuild =[];
 List mapbuild2 =[];
 bool completado =false;
  static final now = new DateTime.now();
  DateTime dt = DateTime.parse(ProgramacionBloc.fechaFin);
  



  initState(){
    // chapo la fecha de fin de ruta y la comparo con la fecha actual 
    int diffDays = now.difference(dt).inHours;
    if(diffDays>=24){
      completado= true;
    }
    print('$now fehcaaaaaa $dt : la diferencia es de  $diffDays');
  }
  //PerfilBloc perfilBloc = PerfilBloc();

 List initialData1 = [
      {
        "title": 'PEAJE',
        "icon":'assets/images/iconos7.png',
      },
      {
        "title": 'COMBUSTIBLE',
        "icon":'assets/images/iconos5.png',
      },
      {
        "title": 'BALANZA',
        "icon":'assets/images/iconos3.png',
      },
      {
        "title": 'VIATICOS',
        "icon":'assets/images/iconos6.png',
      },   
  ];
  List initialData2 = [
      {
        "title": 'LAVADO',
        "icon":'assets/images/iconos4.png',
      },
      {
        "title": 'MECANICA',
        "icon":'assets/images/iconos2.png',
      },
      {
        "title": 'REPUESTOS',
        "icon":'assets/images/iconos.png',
      },
      {
        "title": 'OTROS',
        "icon":'assets/images/iconos2.png',
      }
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
        //color: Colors.red,
        width: double.infinity,
        margin: EdgeInsets.all(1),
        padding: EdgeInsets.all(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            rowsDetalle(initialData1),
            rowsDetalle(initialData2),
/*
          FutureBuilder(          
          initialData: initialData2,
          future:null,// perfilBloc.loadDataPerfil(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.data!=null){
              mapbuild2 = snapshot.data;
            }else{
              //mapbuild = perfilBloc.mapbuild;
            }
            return RowBuilder(
                itemBuilder: (BuildContext context, int index) {
                  return itemdetalle(index);
                },
                itemCount: mapbuild2.length);
          },
        ),*/
        ],)
      );
  }

  Row rowsDetalle(List<dynamic> maps){
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        itemGasto(maps[0]),
        itemGasto(maps[1]),
        itemGasto(maps[2]),
        itemGasto(maps[3]),
      ],
    );
  }

  Widget itemGasto(Map<String,String> item)
  {
    Size size = MediaQuery.of(context).size;
    return Container(      
      decoration: BoxDecoration(
        color: Flush.botonesGasto,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      //alignment: Alignment.center,
      height: size.height*0.15,
      width: size.width*0.20,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(top: 15, bottom: 5,right: 0,left: 0 ),      
      child: InkWell(
        onTap: (){
          print('boton hacia vista de registrar gastos $completado');
          if(completado){
            dialogError('Ya pasaron 24h desde el final de esta Programacion');
          }else{
            print('${item['icon']}');
          Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrarGasstosView(item['title']??'')));
          }          
        },
        child: Column(
          children: [
            item['title']!= 'OTROS'?
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Image.asset('${item['icon']}'),
              height: 50.0,
            ):
            Text('···',style: DesingText.sansBoldText(47,Colors.white)),
           //Icon(item['icon'],color: Colors.white,size: 60,),
            Text('${item['title']}',style: DesingText.regularText(10,Colors.white),)
          ],
        ),
      ),
    );
  }


  dialogError(String texto){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('No puede realizar esta accion'),
        content: Text(texto),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('ok'),
          )
        ],
      )
    );
  }   
}