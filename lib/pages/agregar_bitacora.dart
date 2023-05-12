import 'package:dam_u4_proyecto1_19400586/services/firebase_service.dart';
import 'package:flutter/material.dart';

class AgregarBitacora extends StatefulWidget {
  const AgregarBitacora({Key? key}) : super(key: key);

  @override
  State<AgregarBitacora> createState() => _AgregarBitacoraState();
}

class _AgregarBitacoraState extends State<AgregarBitacora> {

  TextEditingController fechaC = TextEditingController(text: "");
  TextEditingController eventoC = TextEditingController(text: "");
  TextEditingController recursosC = TextEditingController(text: "");
  TextEditingController verificoC = TextEditingController(text: "");
  TextEditingController fechaVerificacionC = TextEditingController(text: "");
  TextEditingController placaC = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Añadir bitácora")),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: [
              Center(
                child: Text("INSERTA LOS DATOS CORRESPONDIENTES",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ),
              Center(
                child: Text("PARA LLENAR LA BITÁCORA",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 25,),
              TextField(
                decoration: InputDecoration(labelText: "FECHA: "),
                controller: fechaC,
              ),
              SizedBox(height: 30,),

              TextField(
                decoration: InputDecoration(labelText: "EVENTO: "),
                controller: eventoC,
              ),
              SizedBox(height: 30,),


              TextField(
                decoration: InputDecoration(labelText: "RECURSOS: "),
                controller: recursosC,
              ),
              SizedBox(height: 30,),
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

              TextField(
                decoration: InputDecoration(
                    labelText: "PLACA: ")
                , controller: placaC,
              ),

              SizedBox(height: 30,),

              SizedBox(
                height: 60, width: 60,
                child:
                ElevatedButton(onPressed: () async {
                  await insertarBitacora(
                      fechaC.text, eventoC.text, recursosC.text,
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
