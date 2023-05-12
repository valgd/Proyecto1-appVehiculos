import 'package:dam_u4_proyecto1_19400586/services/firebase_service.dart';
import 'package:flutter/material.dart';

class Bitacora extends StatefulWidget {
  const Bitacora({Key? key}) : super(key: key);

  @override
  State<Bitacora> createState() => _BitacoraState();
}

class _BitacoraState extends State<Bitacora> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AGREGAR BITÁCORA"),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/');
          }, icon: Icon(Icons.arrow_back))
        ],),
      body:
      FutureBuilder(
          future: getBitacora(),
          builder: ((context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: () async{
                        await Navigator.pushNamed(context, "/actB",
                            arguments: {"fecha": snapshot.data?[index]["fecha"],
                              "evento": snapshot.data?[index]["evento"],
                              "recursos": snapshot.data?[index]["recursos"],
                              "verifico": snapshot.data?[index]["verifico"],
                              "fechaverificacion": snapshot.data?[index]["fechaverificacion"],
                              "placa": snapshot.data?[index]["placa"],
                              "id": snapshot.data?[index]["id"],
                            }
                        );
                        setState(() {

                        });
                      },
                      child: ListTile(
                        title: Text(snapshot.data?[index]['evento']),
                        subtitle: Text("Verificado por: \n" + snapshot.data?[index]['verifico']),
                        trailing: Text("Fecha: " + snapshot.data?[index]['fecha'] + "\n"
                            + "Fecha verificación: " + snapshot.data?[index]['fechaverificacion']),
                        leading: Text("Placa: \n" + snapshot.data?[index]['placa']),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

          })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await Navigator.pushNamed(context, '/addBit');
          setState(() {

          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
