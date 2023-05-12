//import 'dart:html';

import 'package:dam_u4_proyecto1_19400586/services/firebase_service.dart';
import 'package:flutter/material.dart';

class ActualizarBitacora extends StatefulWidget {
  const ActualizarBitacora({Key? key}) : super(key: key);

  @override
  State<ActualizarBitacora> createState() => _ActualizarBitacoraState();
}

class _ActualizarBitacoraState extends State<ActualizarBitacora> {
  TextEditingController verificoC = TextEditingController(text: "");
  TextEditingController fechaVerificacionC = TextEditingController(text: "");

  TextEditingController fechaC = TextEditingController(text: "");
  TextEditingController eventoC = TextEditingController(text: "");
  TextEditingController recursosC = TextEditingController(text: "");

  TextEditingController placaC = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    fechaC.text = arguments["fecha"];
    eventoC.text = arguments["evento"];
    recursosC.text = arguments["recursos"];
    placaC.text = arguments["placa"];
    verificoC.text = arguments["verifico"];
    fechaVerificacionC.text = arguments["fechaverificacion"];


    return Scaffold(
        appBar: AppBar(title: Text("Actualizar bitácora",), centerTitle: true,),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: [
              Center(
                child: Text("ACTUALIZA LOS DATOS CORRESPONDIENTES",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 25,),

              TextField(
                decoration: InputDecoration(labelText: "VERIFICÓ: "),
                controller: verificoC,
              ),
              SizedBox(height: 30,),


              TextField(
                decoration: InputDecoration(
                    labelText: "FECHA DE VERIFICACIÓN: ")
                , controller: fechaVerificacionC,
              ),

              SizedBox(height: 30,),


              SizedBox(
                height: 60, width: 60,
                child:
                ElevatedButton(onPressed: () async {
                  await actualizarBitacora( arguments["id"], fechaC.text,
                      eventoC.text, recursosC.text,
                      verificoC.text, fechaVerificacionC.text, placaC.text).then((_) {
                    Navigator.pop(context);
                  });
                },
                    child: Text("Guardar", style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),)),
              )

            ],
          ),
        )
    );
  }
}
