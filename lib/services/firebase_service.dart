import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore bd = FirebaseFirestore.instance;

// LEER DATOS
//FUNCIÓN QUE REGRESA LA INFORMACIÓN DESDE FIREBASE
Future <List> getVehiculos() async{
  List vehiculo = [];
  
  //CREAR REFERENCIA A LA COLECCIÓN
    CollectionReference collectionReferenceVehiculos = bd.collection('vehiculo');

    //TRAER LOS DOCUMENTOS QUE TIENE LA COLECCIÓN
    // EL ARCHIVO QUERYVEHICULOS CONTIENE Y VA A TRAER TODOS LOS REGISTROS
    QuerySnapshot queryVehiculos = await collectionReferenceVehiculos.get();

    //RECORRER LA LISTA DE DOCUMENTOS
    queryVehiculos.docs.forEach((documento) {

      final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
      final veh = {
        "placa": data["placa"],
        "tipo": data["tipo"],
        "numeroserie" : data["numeroserie"],
        "combustible": data["combustible"],
        "tanque": data["tanque"],
        "trabajador": data["trabajador"],
        "depto": data["depto"],
        "resguardadopor" : data["resguardadopor"],
        "id": documento.id,
      };

      //  agregar los datos del documento a la lista 1 por 1
      vehiculo.add(veh);
    });

    return vehiculo;
}


Future <List> getBitacora() async{
  List bitacora = [];

  //CREAR REFERENCIA A LA COLECCIÓN
  CollectionReference collectionReferenceBitacora = bd.collection('bitacora');

  //TRAER LOS DOCUMENTOS QUE TIENE LA COLECCIÓN
  // EL ARCHIVO QUERYVEHICULOS CONTIENE Y VA A TRAER TODOS LOS REGISTROS
  QuerySnapshot queryBitacora = await collectionReferenceBitacora.get();

  //RECORRER LA LISTA DE DOCUMENTOS
  queryBitacora.docs.forEach((documento) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final bit = {
      "fecha": data["fecha"],
      "evento": data["evento"],
      "recursos": data["recursos"],
      "verifico": data["verifico"],
      "fechaverificacion": data["fechaverificacion"],
      "placa": data["placa"],
      "id": documento.id,
    };

    //  agregar los datos del documento a la lista 1 por 1
    bitacora.add(bit);
  });

  return bitacora;
}

//GUARDAR EN LA BD
Future<void> insertarVehiculo(String placa, String tipo,
    String numeroserie, String combustible, String tanque,
    String trabajador, String depto, String resguardadopor) async{
  await bd.collection("vehiculo").add({"placa": placa, "tipo":tipo,
    "numeroserie":numeroserie, "combustible":combustible, "tanque":tanque,
    "trabajador":trabajador, "depto":depto, "resguardadopor":resguardadopor});
}

Future<void> insertarBitacora(String fecha, String evento,
String recursos, String verifico, String fechaverificacion, String placa) async{
  await bd.collection("bitacora").add({"fecha":fecha, "evento":evento,
  "recursos":recursos, "verifico":verifico, "fechaverificacion":fechaverificacion,
  "placa":placa});
}

//ACTUALIZAR EN LA BD
Future<void> actualizarVehiculo(String id, String placaAct, String tipoAct,
String numeroserieAct, String combustibleAct, String tanqueAct,
String trabajadorAct, String deptoAct, String resguardadoporAct) async{
  await bd.collection("vehiculo").doc(id).set({"placa": placaAct,
  "tipo": tipoAct, "numeroserie":numeroserieAct, "combustible": combustibleAct,
  "tanque": tanqueAct, "trabajador": trabajadorAct,
  "depto": deptoAct, "resguardadopor": resguardadoporAct});
}

Future<void> actualizarBitacora(String id, String fechaAct, String eventoAct,
    String recursosAct, String verificoAct, String fechaverificacionAct,
    String placaAct,
    ) async{
  await bd.collection("bitacora").doc(id).set({
  "fecha": fechaAct, "evento": eventoAct, "recursos": recursosAct, "verifico": verificoAct,
    "fechaverificacion": fechaverificacionAct, "placa": placaAct});
}

//ELIMINAR EN LA BD
Future <void> eliminarVehiculo(String id) async{
  await bd.collection("vehiculo").doc(id).delete();
}

// CONSULTAS
// consulta de bitacora (listado de todas las salidas o utilizaciones) de un vehículo por PLACA
Future<List<String>> getPlacas() async {
  List<String> placas = [];
  QuerySnapshot querySnapshot = await bd.collection("bitacora").get();
  for (var docSnapshot in querySnapshot.docs) {
    final Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
    placas.add(data['placa']);
  }
  return placas;
}

Future<List<Map<String,dynamic>>> consultaUno(String placa) async{
  List<Map<String, dynamic>> consulta = [];
  QuerySnapshot querySnapshot = await bd.collection("bitacora").where("placa", isEqualTo: placa).get();
  for(var docSnapshot in querySnapshot.docs){
    final Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
    consulta.add({"placa": data["placa"], "fecha": data["fecha"],
    "evento": data["evento"], "recursos": data["recursos"], "verifico": data["verifico"],
      "fechaverificacion": data["fechaverificacion"]
    });
  }
  return consulta;
}

// consulta de bitacora (listado de todas las salidas o utilizaciones) de TODOS vehículo por según fecha específica
Future<List<Map<String, dynamic>>> consultaDos(String fecha) async{
  List<Map<String, dynamic>> consulta =[];
  QuerySnapshot querySnapshot = await bd.collection("bitacora").where("fecha", isEqualTo: fecha).get();
  for(var docSnapshot in querySnapshot.docs){
    final Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
    consulta.add({"placa": data["placa"], "fecha": data["fecha"],
      "evento": data["evento"], "recursos": data["recursos"], "verifico": data["verifico"],
      "fechaverificacion": data["fechaverificacion"]
    });
  }
  return consulta;
  }