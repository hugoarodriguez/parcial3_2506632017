// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

//Pantallas
import 'package:parcial3_2506632017/screens/usuario_screen.dart';

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
      initialRoute: 'usuario',
      routes: {
        'usuario' : (BuildContext context) => UsuarioScreen(),
      },
    );
  }
}