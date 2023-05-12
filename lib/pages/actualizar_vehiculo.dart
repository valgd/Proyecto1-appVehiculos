import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

List tipoC = ["Camión", "Coche", "Camioneta", "Tractor", "Motocicleta"];
List combustibleC = ["Disel", "Gasolina regular", "Gasolina premium"];
List deptoC = ["Materiales", "Jardinería", "Dirección", "Seguridad"];

class ActualizarVehiculo extends StatefulWidget {
  const ActualizarVehiculo({Key? key}) : super(key: key);

  @override
  State<ActualizarVehiculo> createState() => _ActualizarVehiculoState();
}

class _ActualizarVehiculoState extends State<ActualizarVehiculo> {
  TextEditingController placaC = TextEditingController(text: "");
  TextEditingController numeroserieC = TextEditingController(text: "");
  TextEditingController tanqueC = TextEditingController(text: "");
  TextEditingController trabajadorC = TextEditingController(text: "");
  TextEditingController resguardadoporC = TextEditingController(text: "");

  String _tipoS = tipoC.first;
  String _combustibleS = combustibleC.first;
  String _deptoS = deptoC.first;

  @override
  Widget build(BuildContext context) {
    
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    placaC.text = arguments["placa"];
    numeroserieC.text = arguments["numeroserie"];
    tanqueC.text = arguments["tanque"];
    trabajadorC.text = arguments["trabajador"];
    resguardadoporC.text = arguments["resguardadopor"];


    
    return Scaffold(
        appBar: AppBar(title: Text("Actualizar vehiculo")),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: [
              Center(
                child: Text("ACTUALIZA LOS DATOS DEL VEHÍCULO ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 25,),
              TextField(
                decoration: InputDecoration(labelText: "PLACA: "),
                controller: placaC,
              ),
              SizedBox(height: 30,),
              Text("Tipo de vehículo: ", style: TextStyle(fontSize: 15),),
              DropdownButtonFormField(
                  value: _tipoS,
                  items: tipoC.map((valor){
                    return DropdownMenuItem(child: Text(valor), value: valor,);
                  }).toList(),
                  onChanged: (valor) {
                    setState(() {
                      _tipoS = valor.toString();
                    });
                  }),
              SizedBox(height: 30,),

              TextField(
                decoration: InputDecoration(labelText: "NÚMERO DE SERIE: "),
                controller: numeroserieC,
              ),
              SizedBox(height: 30,),

              Text("Combustible: ", style: TextStyle(fontSize: 15),),
              DropdownButtonFormField(
                  value: _combustibleS,
                  items: combustibleC.map((valor){
                    return DropdownMenuItem(child: Text(valor), value: valor,);
                  }).toList(),
                  onChanged: (valor) {
                    setState(() {
                      _combustibleS = valor.toString();
                    });
                  }),
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(labelText: "TANQUE: "),
                controller: tanqueC,
              ),
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(labelText: "TRABAJADOR: "),
                controller: trabajadorC,
              ),
              SizedBox(height: 30,),

              Text("Departamento al que pertenece: ", style: TextStyle(fontSize: 15),),
              DropdownButtonFormField(
                  value: _deptoS,
                  items: deptoC.map((valor){
                    return DropdownMenuItem(child: Text(valor), value: valor,);
                  }).toList(),
                  onChanged: (valor) {
                    setState(() {
                      _deptoS = valor.toString();
                    });
                  }),
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(labelText: "RESGUARDADO POR: ")
                ,controller: resguardadoporC,
              ),

              SizedBox(height: 30,),

              SizedBox(
                height: 60,width: 60,
                child:
                ElevatedButton(onPressed: () async{
                  await actualizarVehiculo(arguments["id"],
                  placaC.text, _tipoS, numeroserieC.text,
                      _combustibleS, tanqueC.text, trabajadorC.text,
                      _deptoS, resguardadoporC.text).then((_) {
                        Navigator.pop(context);
                  });

                }, child: Text("Actualizar", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
              )

            ],
          ),
        )


    );
  }
}
