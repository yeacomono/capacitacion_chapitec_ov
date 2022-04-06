import 'package:capacitacion_flutter_gran_chapo/src/Pages/Login/Screens/Login-View.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Pages/NewHome/newhome.dart';
import 'package:capacitacion_flutter_gran_chapo/src/Routes/Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 
void main(){
   WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,     
   ]);
   runApp(const MyApp());

}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chofere Shalom',
      initialRoute: NewHomeView.name,
      routes: Routes.rutes,
      
    );
  }
}