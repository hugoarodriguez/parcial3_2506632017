// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:parcial3_2506632017/providers/configuraciones_provider.dart';

class ConfiguracionScreen extends StatelessWidget {
  const ConfiguracionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50.0,),
      
                Text('Configuraciones', style: TextStyle(color: Colors.white, fontSize: 45.0) ),
                SizedBox( height: 30.0 ),
                _ConfiguracionForm(),
                SizedBox( height: 30.0 ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ConfiguracionForm extends StatefulWidget {

  @override
  State<_ConfiguracionForm> createState() => _ConfiguracionFormState();
}

class _ConfiguracionFormState extends State<_ConfiguracionForm> {
  
  final _formKey = GlobalKey<FormState>();

  //Controladores
  final TextEditingController _idusuario = TextEditingController();
  final TextEditingController _nombre = TextEditingController();
  final TextEditingController _valor = TextEditingController();


  @override
  Widget build(BuildContext context) {

    ConfiguracionesProvider configuracionesProvider = ConfiguracionesProvider();

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0,),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 10.0,
      child: Form(
        key: _formKey,
        child: Column(
          children: [

            SizedBox( height: 30 ),

            //IdDe
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                controller: _idusuario,
                autocorrect: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '1',
                  labelText: 'Id Usuario',
                  prefixIcon: Icon(Icons.format_list_numbered_outlined),
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar un Id de propietario';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //Nombre
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: _nombre,
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Configuración 1',
                  labelText: 'Nombre de Configuracion',
                  prefixIcon: Icon(Icons.text_fields_rounded)
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar un nombre';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //Valor
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: _valor,
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Mis valor',
                  labelText: 'Valor',
                  prefixIcon: Icon(Icons.text_fields_rounded)
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar un tag';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //Botón
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.indigo,
              child: Container(
                padding: EdgeInsets.symmetric( horizontal: 80, vertical: 15),
                child: Text('Ingresar',style: TextStyle( color: Colors.white ),
                )
              ),
              onPressed: () async {
                
                if(_formKey.currentState!.validate()){
                  bool r = await configuracionesProvider.aggConfiguracion(int.parse(_idusuario.text), _nombre.text, _valor.text);

                  if(r){
                    //Si se guardó el usuario
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Guardando configuracion'))
                    );

                    //Redirigimos a pantalla de consulta
                    Navigator.pushReplacementNamed(context, 'configuraciones');
                  } else {
                    //Si no se guardó el usuario
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('No se pudo guardar la configuracion'))
                      );
                  }

                }
              }
            ),
            SizedBox( height: 30 ),

          ],
        ),
      ),
    );
  }
}