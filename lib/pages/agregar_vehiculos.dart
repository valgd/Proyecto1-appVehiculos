
import 'package:dam_u4_proyecto1_19400586/services/firebase_service.dart';
import 'package:flutter/material.dart';

List tipoC = ["Camión", "Coche", "Camioneta", "Tractor", "Motocicleta"];
List combustibleC = ["Disel", "Gasolina regular", "Gasolina premium"];
List deptoC = ["Materiales", "Jardinería", "Dirección", "Seguridad"];



class Vehiculos extends StatefulWidget {
  const Vehiculos({Key? key}) : super(key: key);

  @override
  State<Vehiculos> createState() => _VehiculosState();
}

class _VehiculosState extends State<Vehiculos> {
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
    return Scaffold(
      appBar: AppBar(title: Text("Añadir vehiculos")),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            Center(
              child: Text("INSERTA LOS DATOS CORRESPONDIENTES ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            ),
            Center(
              child: Text("AL VEHÍCULO A AGREGAR",
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
                await insertarVehiculo(placaC.text, _tipoS.toString(), numeroserieC.text, _combustibleS.toString(),
                    tanqueC.text, trabajadorC.text, _deptoS.toString(),resguardadoporC.text ).then((_){
                  Navigator.pop(context);
                });

              }, child: Text("Guardar", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
            )

          ],
        ),
      )
      

    );
  }
}
