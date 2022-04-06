import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class OvarHeader extends StatelessWidget {
  const OvarHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        height: size.height * 0.48,
        color: Flush.colorGlobal,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //color: Colors.black,
                height: size.width * 0.08,
                width: size.width * 0.75,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                  ),
                )),
              ),
              Text('CHOFERES',style: DesingText.botonblobal(15, Colors.white),)
            ],
          ),
        ),
      ),
    );
  }

}
