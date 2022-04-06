import 'package:capacitacion_flutter_gran_chapo/src/Pages/Gastos/Bloc/Relevos-Bloc.dart';
import 'package:flutter/material.dart';

class SelectCombustible extends StatefulWidget {
  const SelectCombustible({Key? key,}) : super(key: key);
  
  @override
  _SelectCombustibleState createState() => _SelectCombustibleState();
}

class _SelectCombustibleState extends State<SelectCombustible> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            child: DropdownButton<String>(
              value:GastosBloc.selecOption,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  GastosBloc.selecOption = newValue!;
                  //dropdownValue1 = dropdownValue;
                  //print(dropdownValue);
                });
              },
              items: <String>["Combustible", 'Peaje', 'Viático', 'Lavado de unidad']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
