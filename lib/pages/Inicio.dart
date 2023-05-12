import 'package:dam_u4_proyecto1_19400586/pages/bitacora.dart';
import 'package:dam_u4_proyecto1_19400586/pages/consultas.dart';
import 'package:flutter/material.dart';

import 'Programa.dart';
import 'agregar_vehiculos.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("COCHE-TEC"),
          centerTitle: true,),
        body:
        ListView(
          padding: EdgeInsets.all(30),
          children: [
            Row(
              children: [
                SizedBox(
                  height: 40, width: 40, child: Image(image: AssetImage('assets/itt.png'),),
                ),
                SizedBox(width: 25,),
                Column(
                  children: [
                    Text("INSTITUTO TECNOLÓGICO", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("DE TEPIC",  style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),

                SizedBox(width: 25,),

                SizedBox(
                  height: 40, width: 40, child: Image(image: AssetImage('assets/tecnm.png'),),
                ),
              ],
            ),

            SizedBox(height: 50,),
            Center(
              child:  Text("BIENVENIDO",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),) ,
            ),
            SizedBox(height: 15,),
            Center(
              child:
              Text("REGISTRO DE VEHÍCULOS", style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold,)),
            ),

            SizedBox(height: 40,),
            Center(
              child: Text("¿QUÉ DESEA CONSULTAR HOY?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            ),
            SizedBox(height: 35,),

            SizedBox(
              width: 50, height: 50,
              child:
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => Programa()));
              }, child: Text("VEHÍCULOS", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
            ),

            SizedBox(height: 35,),

            SizedBox(
              width: 50, height: 50,
              child:
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => Bitacora()));
              }, child: Text("BITÁCORA", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
            ),

            SizedBox(height: 35,),

            SizedBox(
              width: 50, height: 50,
              child:
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => Consultas()));
              }, child: Text("INFORMACIÓN ESPECÍFICA", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
            ),

          ],
        )
    );
  }
}
