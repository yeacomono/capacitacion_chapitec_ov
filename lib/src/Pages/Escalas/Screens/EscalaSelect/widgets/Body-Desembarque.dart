import 'package:capacitacion_flutter_gran_chapo/src/Pages/Escalas/Bloc/Escala-Select-Bloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:flutter/material.dart';

class BodyDesembarqueAlert extends StatefulWidget {
  const BodyDesembarqueAlert({Key? key}) : super(key: key);
  static final ScalaSelectBloc escalasSelectBloc = ScalaSelectBloc();

  @override
  _BodyDesembarqueAlertState createState() => _BodyDesembarqueAlertState();
}

class _BodyDesembarqueAlertState extends State<BodyDesembarqueAlert> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
              textWithCheckBox("BOLSAS",checkBoxOne,BodyDesembarqueAlert.escalasSelectBloc.getbolsas),
              textWithCheckBox("GUIAS",checkBoxTwo,BodyDesembarqueAlert.escalasSelectBloc.getGuias),
              textWithCheckBox("GIROS",chackBoxThree,BodyDesembarqueAlert.escalasSelectBloc.getgiros),
              textWithCheckBox("PAQUETERIAS",checkBoxFour,BodyDesembarqueAlert.escalasSelectBloc.getpaqueterias),
              Container(height: 5,),
          ],
        ),
      ],
    );
  }

  textWithCheckBox(String text,Function(bool?) onchanged,bool){
    return Row(
      children: [
        Text(text ,style: DesingText.regularText(15,Flush.colorGlobal)),
        Expanded(child: Container()),
        Checkbox(
              checkColor: Colors.blueGrey.shade50,
              value: bool,
              onChanged: onchanged
        ),       
    ],);
  }

  checkBoxOne(value) {
     setState(() {
       
     });
     BodyDesembarqueAlert.escalasSelectBloc.setbolsas = value;
  }

   checkBoxTwo(value) {
     setState(() {
       
     });
     BodyDesembarqueAlert.escalasSelectBloc.setGuias = value;
   }

   chackBoxThree(value) {
     setState(() {});
     BodyDesembarqueAlert.escalasSelectBloc.setgiros = value;
   }

   checkBoxFour(value) {
     setState(() {
       
     });
     BodyDesembarqueAlert.escalasSelectBloc.setpaqueterias = value;
   }
}
