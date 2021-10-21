// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_element, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Parcial 3'),
        ),
        body: _opciones(context),
      ),
    );
  }

  Widget _opciones(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _crearBoton(context, 'Usuarios', 'usuarios'),
              SizedBox(height: 30,),
              _crearBoton(context, 'Configuracion', 'configuraciones'),
              SizedBox(height: 30,),
              _crearBoton(context, 'Mensajes', 'mensajes'),
              SizedBox(height: 30,),
              _crearBoton(context, 'Grupos', 'grupos'),
              SizedBox(height: 30,),
              _crearBoton(context, 'Calendario', 'calendarios'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _crearBoton(BuildContext context, String opcion, String routeName){

    final estiloBoton = ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled))
              return Colors.grey;//Color si está deshabilitado
            return Colors.white; //Color si está habilitado
          },
        ),
        elevation: MaterialStateProperty.all<double>(10.0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))
      );

    return SizedBox(
      width: 250.0,
      height: 70.0,
      child: ElevatedButton(
        child: Container(
          //padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0 ),
          child: Text(opcion, style: TextStyle(color: Colors.black, fontSize: 18.0) ,),
        ),
        style: estiloBoton,            
        onPressed: () => Navigator.pushReplacementNamed(context, routeName)
      ),
    );
  }
}