import 'package:dam_u4_proyecto1_19400586/pages/ConsultaDos.dart';
import 'package:dam_u4_proyecto1_19400586/pages/consultaCuatro.dart';
import 'package:dam_u4_proyecto1_19400586/pages/consultaTres.dart';
import 'package:dam_u4_proyecto1_19400586/pages/consultaUno.dart';
import 'package:flutter/material.dart';

class Consultas extends StatefulWidget {
  const Consultas({Key? key}) : super(key: key);

  @override
  State<Consultas> createState() => _ConsultasState();
}

class _ConsultasState extends State<Consultas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("CONSULTAS"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, '/');
            }, icon: Icon(Icons.arrow_back))
          ],),
        body:
        ListView(
          padding: EdgeInsets.all(30),
          children: [

            SizedBox(height: 40,),
            Center(
              child: Text("CONSULTAR  BITÁCORA POR:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            ),
            SizedBox(height: 40,),

            SizedBox(
              width: 50, height: 50,
              child:
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => ConsultaUno()));
              }, child: Text("PLACA", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
            ),

            SizedBox(height: 40,),

            SizedBox(
              width: 50, height: 50,
              child:
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => ConsultaDos()));
              }, child: Text("FECHA", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
            ),

            SizedBox(height: 40,),

            Center(
              child: Text("CONSULTAR  VEHÍCULOS POR:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            ),

            SizedBox(height: 40,),

            SizedBox(
              width: 50, height: 50,
              child:
              ElevatedButton(onPressed: (){

              }, child: Text("VEHÍCULOS EN USO", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
            ),

            SizedBox(height: 40,),

            SizedBox(
              width: 50, height: 50,
              child:
              ElevatedButton(onPressed: (){

              }, child: Text("DEPARTAMENTO", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
            ),

          ],
        )
    );
  }
}
