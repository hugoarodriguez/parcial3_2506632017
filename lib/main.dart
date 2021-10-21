// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

//Pantallas
import 'package:parcial3_2506632017/screens/home_screen.dart';
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
        'usuario' : (BuildContext context) => UsuarioScreen(),
        'usuario_edit' : (BuildContext context) => UsuarioEditScreen(),
        'usuarios' : (BuildContext context) => UsuariosScreen(),
      },
    );
  }
}