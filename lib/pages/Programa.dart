import 'package:dam_u4_proyecto1_19400586/services/firebase_service.dart';
import 'package:flutter/material.dart';

class Programa extends StatefulWidget {
  const Programa({Key? key}) : super(key: key);

  @override
  State<Programa> createState() => _ProgramaState();
}

class _ProgramaState extends State<Programa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AGREGAR VEHÍCULOS"),
      actions: [
        IconButton(onPressed: (){
          Navigator.pushNamed(context, '/');
        }, icon: Icon(Icons.arrow_back))
      ],),
      body:
      FutureBuilder(
          future: getVehiculos(),
          builder: ((context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index){
                    return Dismissible(
                      onDismissed: (direction) async{
                        await eliminarVehiculo(snapshot.data?[index]["id"]);
                      },

                      confirmDismiss: (direction) async{
                        bool resultado = false;

                        resultado = await showDialog(context: context,
                            builder: (context){
                            return AlertDialog(
                              title: Text("¿Desea eliminar al vehículo con placa "
                                  "${snapshot.data?[index]["placa"]}?"),
                              actions: [
                                TextButton(onPressed: (){
                                  return Navigator.pop(
                                      context,
                                      false,
                                  );
                                }, child: Text("No")),
                                TextButton(onPressed: (){
                                  return Navigator.pop(
                                    context,
                                    true,
                                  );
                                }, child: Text("Sí"))
                              ],
                            );
                        });

                        return resultado;
                      },
                      background: Container(
                        color: Colors.red,
                        child: Icon(Icons.delete),
                      ),
                      direction: DismissDirection.startToEnd,

                      key: UniqueKey(),
                      //key: Key(snapshot.data?[index]["id"]),
                      
                      child: ListTile(
                        title: Text("Placa: " + snapshot.data?[index]['placa']),
                        subtitle: Text("Trabajador " + snapshot.data?[index]['trabajador']),
                        trailing: Text("Tipo: \n" + snapshot.data?[index]['tipo']),
                        leading: Text("Departamento: \n" + snapshot.data?[index]['depto']),

                        onTap: () async{
                          await Navigator.pushNamed(context, "/actV",
                              arguments: {"placa": snapshot.data?[index]["placa"],
                                "tipo": snapshot.data?[index]["tipo"],
                                "numeroserie": snapshot.data?[index]["numeroserie"],
                                "combustible": snapshot.data?[index]["combustible"],
                                "tanque": snapshot.data?[index]["tanque"],
                                "trabajador": snapshot.data?[index]["trabajador"],
                                "depto": snapshot.data?[index]["depto"],
                                "resguardadopor": snapshot.data?[index]["resguardadopor"],
                                "id": snapshot.data?[index]["id"],
                              }
                          );
                          setState(() {

                          });
                        },
                      
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
          await Navigator.pushNamed(context, '/add');
          setState(() {

          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
