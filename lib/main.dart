import 'package:dam_u4_proyecto1_19400586/pages/Inicio.dart';
import 'package:dam_u4_proyecto1_19400586/pages/Programa.dart';
import 'package:dam_u4_proyecto1_19400586/pages/actualizar_bitacora.dart';
import 'package:dam_u4_proyecto1_19400586/pages/actualizar_vehiculo.dart';
import 'package:dam_u4_proyecto1_19400586/pages/agregar_bitacora.dart';
import 'package:dam_u4_proyecto1_19400586/pages/agregar_vehiculos.dart';
import 'package:dam_u4_proyecto1_19400586/pages/bitacora.dart';
import 'package:dam_u4_proyecto1_19400586/pages/consultas.dart';
import 'package:flutter/material.dart';

//importaciones de firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      //SISTEMA DE RUTAS
      routes: {
        '/':(context) => const Inicio(),
        '/vehiculos': (context) => const Programa(),
        '/add': (context) => const Vehiculos(),
        '/addBit': (context) => const AgregarBitacora(),
        '/actV' : (context) => const ActualizarVehiculo(),
        '/actB' : (context) => const ActualizarBitacora(),
        '/bit' : (context) => const Bitacora(),
        '/cons' : (context) => const Consultas(),
      },
    );
  }
}

