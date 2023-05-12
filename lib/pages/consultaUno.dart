import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

class ConsultaUno extends StatefulWidget {
  const ConsultaUno({Key? key}) : super(key: key);

  @override
  State<ConsultaUno> createState() => _ConsultaUnoState();
}
final placaCons = TextEditingController();

class _ConsultaUnoState extends State<ConsultaUno> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PLACAS",),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/cons');
          }, icon: Icon(Icons.arrow_back))
        ],),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          Text("Consulte las bitácoras actuales", style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
          SizedBox(height: 10,),
          SizedBox(
            height: 50,
            width: 50,
            child: ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/bit');
            }, child: Text("Ver todas las bitácoras")),

          ),
          SizedBox(height: 20,),

          Text("Inserte la placa de la bitácora que desea consultar:", style: TextStyle(fontSize: 15)),

        TextField(decoration: InputDecoration(labelText: "Placa:",),
        controller: placaCons,),

          SizedBox(height: 30,),

          SizedBox(
            height: 50, width: 50,
            child: ElevatedButton(onPressed: () async {
              setState(() {
                placaCons.text;
              });
            }, child: Text("Consultar",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
            ),
          ),

         SizedBox(height: 30,),

          Text("Bitácora obtenida: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),


         FutureBuilder<List<Map<String, dynamic>>>(
            future: consultaUno(placaCons.text),
            builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot){
              if(snapshot.hasData){
                return
                  Container(
                    height: 200,
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index){
                          return
                            Text("Placas: ${snapshot.data![index]["placa"]}\n"
                                "\n Fecha:  ${snapshot.data![index]["fecha"]}\n"
                                "\n Evento: ${snapshot.data![index]["evento"]}\n"
                                "\n Recursos: ${snapshot.data![index]["recursos"]}\n"
                                "\n Verificado por: ${snapshot.data![index]["verifico"]}\n"
                                "\n Fecha de verificación: ${snapshot.data![index]["fechaverificacion"]} \n",
                              style: TextStyle(fontSize: 15,),
                            );

                        }

                    ),
                  );
              } else{
                return Text("");
              }


            } ,

          ),



        ],

      ),
    );
  }
}
