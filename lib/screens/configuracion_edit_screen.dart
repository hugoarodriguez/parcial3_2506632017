// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:parcial3_2506632017/models/configuracion_model.dart';
import 'package:parcial3_2506632017/providers/configuraciones_provider.dart';

class ConfiguracionEditScreen extends StatelessWidget {
  const ConfiguracionEditScreen({Key? key}) : super(key: key);

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
                _ConfiguracionEditForm(),
                SizedBox( height: 30.0 ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ConfiguracionEditForm extends StatefulWidget {

  @override
  State<_ConfiguracionEditForm> createState() => _ConfiguracionEditFormState();
}

class _ConfiguracionEditFormState extends State<_ConfiguracionEditForm> {
  
  final _formKey = GlobalKey<FormState>();

 //Controladores
  final TextEditingController _idusuario = TextEditingController();
  final TextEditingController _nombre = TextEditingController();
  final TextEditingController _valor = TextEditingController();
  
  ConfiguracionesProvider configuracionesProvider = ConfiguracionesProvider();



  @override
  Widget build(BuildContext context) {

    final idConfiguracion = ModalRoute.of(context)!.settings.arguments;

    return FutureBuilder(
      future: configuracionesProvider.getConfiguracion(idConfiguracion.toString()),
      builder: (context, AsyncSnapshot<List<ConfiguracionModel>> snapshot){

        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }

        if(snapshot.hasData){
          var datosConfiguracion = snapshot.data;

          _idusuario.text = datosConfiguracion![0].idusuario.toString();
          _nombre.text = datosConfiguracion[0].nombre;
          _valor.text = datosConfiguracion[0].valor;

          return mainContent(idConfiguracion.toString());
        }

        return Center(child: CircularProgressIndicator(),);
      }
    );
  }

  Widget mainContent(String idConfiguracion){
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
                child: Text('Actualizar',style: TextStyle( color: Colors.white ),
                )
              ),
              onPressed: () async {
                
                if(_formKey.currentState!.validate()){
                  bool r = await configuracionesProvider.actConfiguracion(idConfiguracion, int.parse(_idusuario.text), _nombre.text, _valor.text);

                  if(r){
                    //Si se guardó el configuracion
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Actualizando configuracion'))
                    );

                    //Redirigimos a pantalla de consulta
                    Navigator.pushReplacementNamed(context, 'configuraciones');
                    
                  } else {
                    //Si no se guardó el configuracion
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