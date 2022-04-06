import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:flutter/material.dart';

class AlertGeneral {
  
  showDialogGeneral(context,
      {
      required Function() eventAgree, 
      Widget? titleDialgo, 
      Widget? body,
      Stream<int>? stream,
      double? height,
      Stream<String>? streamtext,
      }
    ){
    final size = MediaQuery.of(context).size;
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              width: size.width * 0.8,
              height: height??300,
              child: Column(
                children: [
                  headerDialog(titleDialgo),
                  Expanded(child: bodyDialog(body)),
                  textStream(streamtext),
                  bottomDialog(context, eventAgree,stream),
              ],
            ),
          ),
        );
      }
    );
  }

  textStream(Stream<String>? streamtext) {
    return StreamBuilder(
      stream: streamtext,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Text(snapshot.data??"", style:  DesingText.regularBoldText(15, Flush.colorTextsubtitle),),
        );
      },
    );
  }
}

bodyDialog(Widget? body) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),

    alignment: Alignment.center,
    child: body,
  );
}

headerDialog(Widget? titleDialgo) {
  return Container(
    child: titleDialgo,
  );
}

 bottomDialog(context, Function() eventAgree,Stream<int>? stream) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        botonClose(context,stream ),
        botonAgree(eventAgree),
      ],
    ),
  );
}

botonClose(context,Stream<int>? stream) {
  return StreamBuilder(
    initialData: 2,
    stream:stream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      int data = snapshot.data;
      return Container(
        decoration: BoxDecoration(
        color: data==1?Colors.green:Flush.rosado, 
        borderRadius: BorderRadius.circular(10)
        ),
        width: 60,
        height: 60,
        child: Center(
          child: data == 2?
          IconButton(
            onPressed: () {
              print('Dialog Cerrado...');
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              //size: 30,
              color: Colors.white,
            ),
          ):data==1?
          IconButton(
            onPressed: () {
              print('Dialog Cerrado...');
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.check,
              //size: 30,
              color: Colors.white,
            ),           
          ):
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircularProgressIndicator(color: Colors.white,),
          ), 
        )
      );
    },
  );
}
/*botonClose(context) {
  return Container(
    decoration: BoxDecoration(
        color: Flush.rosado, borderRadius: BorderRadius.circular(10)),
    width: 60,
    height: 60,
    child: Center(
      child: IconButton(
        onPressed: () {
           print('Dialog Cerrado...');
           Navigator.pop(context);
        },
        icon: Icon(
          Icons.close,
          //size: 30,
          color: Colors.white,
        ),
      ),
    ),
  );
}*/

botonAgree(Function() eventAgree) {
  return InkWell(
    splashColor: Colors.black,
    onTap: eventAgree,
    child: Container(
      decoration: BoxDecoration(
          color: Flush.colorGlobal, borderRadius: BorderRadius.circular(10)),
      width: 150,
      height: 60,
      child: Center(
        child: Text('ACEPTAR',style: DesingText.sansBoldText(null, Colors.white),),
      ),
    ),
  );
}
