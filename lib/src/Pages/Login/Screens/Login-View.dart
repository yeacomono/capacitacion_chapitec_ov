import 'package:capacitacion_flutter_gran_chapo/src/Pages/Login/Bloc/LoginBloc.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Login/Oval-header.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/Perfil/Widgets/List-Details.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Singleton/LoginUser.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/DesingTexts.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Styles/Flush.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/BotonGeneral.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/Input-global-desing.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Widgets/layout-view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  static final String name = "LoginView";
  static LoginUser loginUser = LoginUser();
  static String? titlButton = "INGRESAR";
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  LoginBloc loginBloc = new LoginBloc();
  int animated = 1;

  @override
  Widget build(BuildContext context) {
    return LayoutView(
      body: body(context),
      appbar: false,
    );
  }

  Widget body(context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        child: Column(
          children: [
            OvarHeader(),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: InputGlobalDesing(
                      isOnlyNumber: true,
                      controller: controllerUser,
                      hintText: 'USUARIO',
                      width: size.width * 0.70,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: InputGlobalDesing(
                      isPassword: true,
                      controller: controllerPassword,
                      hintText: 'PASSWORD',
                      width: size.width * 0.7,
                    ),
                  ),
                  streamBotonReactive(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  streamBotonReactive() {
    final size = MediaQuery.of(context).size;
    return StreamBuilder<String?>(
      initialData: "INGRESAR",
      stream:loginBloc.animatedS,
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if(snapshot.data=="INGRESAR"){
          animated = 1;
        }else if(snapshot.data=="ERROR"){
          animated = 2;
        }  
        return Container(
          child: AnimatedContainer(
          width: size.width * 0.7 /animated,
          curve: Curves.fastOutSlowIn,
          duration: Duration(seconds: 2),
          child: BotonGeneral(
              borderCircle: true,
              borderRaidus: 7,
              color: Flush.colorGlobal,
              addIcon: false,
              height: 50,
              widgetTitle:snapshot.data=="INGRESAR"?
                  Text(snapshot.data??'',style:DesingText.botonblobal(null,Colors.white),)
                  :CircularProgressIndicator(color: Colors.white,),
              event: () async {
                loginBloc.animatedC.sink.add("ERROR");              
                await loginBloc.callService(context, controllerUser.text, controllerPassword.text);
                loginUser.userData.user = controllerUser.text;
                
            }
          ),
         )
        );
      },
    );
  }
}
