// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:parcial3_2506632017/screens/calendario_edit_screen.dart';
import 'package:parcial3_2506632017/screens/calendario_screen.dart';
import 'package:parcial3_2506632017/screens/calendarios_screen.dart';
import 'package:parcial3_2506632017/screens/configuracion_edit_screen.dart';
import 'package:parcial3_2506632017/screens/configuracion_screen.dart';
import 'package:parcial3_2506632017/screens/configuraciones_screen.dart';

//Pantallas
import 'package:parcial3_2506632017/screens/home_screen.dart';
import 'package:parcial3_2506632017/screens/mensaje_edit_screen.dart';
import 'package:parcial3_2506632017/screens/mensaje_screen.dart';
import 'package:parcial3_2506632017/screens/mensajes_screen.dart';
import 'package:parcial3_2506632017/screens/usuario_edit_screen.dart';
import 'package:parcial3_2506632017/screens/usuario_screen.dart';
import 'package:parcial3_2506632017/screens/usuarios_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp();
  runApp(Parcial3());
}

class Parcial3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.deepOrange
      ),
      debugShowCheckedModeBanner: false,
      title: 'Parcial 3',
      initialRoute: 'home_screen',
      routes: {
        'home_screen' : (BuildContext context) => HomeScreen(),
        'usuarios' : (BuildContext context) => UsuariosScreen(),
        'usuario_add' : (BuildContext context) => UsuarioScreen(),
        'usuario_edit' : (BuildContext context) => UsuarioEditScreen(),
        'configuraciones' : (BuildContext context) => ConfiguracionesScreen(),
        'configuracion_add' : (BuildContext context) => ConfiguracionScreen(),
        'configuracion_edit' : (BuildContext context) => ConfiguracionEditScreen(),
        'mensajes' : (BuildContext context) => MensajesScreen(),
        'mensaje_add' : (BuildContext context) => MensajeScreen(),
        'mensaje_edit' : (BuildContext context) => MensajeEditScreen(),
        'calendarios' : (BuildContext context) => CalendariosScreen(),
        'calendario_add' : (BuildContext context) => CalendarioScreen(),
        'calendario_edit' : (BuildContext context) => CalendarioEditScreen(),
      },
    );
  }
}

//configuracion