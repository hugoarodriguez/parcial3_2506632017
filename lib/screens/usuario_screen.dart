// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

class UsuarioScreen extends StatelessWidget {
  const UsuarioScreen({Key? key}) : super(key: key);

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
      
                Text('Usuarios', style: TextStyle(color: Colors.white, fontSize: 45.0) ),
                SizedBox( height: 30.0 ),
                _UsuarioForm(),
                SizedBox( height: 30.0 ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UsuarioForm extends StatefulWidget {

  @override
  State<_UsuarioForm> createState() => _UsuarioFormState();
}

class _UsuarioFormState extends State<_UsuarioForm> {
  
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    String valorDropDownNivel = 'Seleccionar nivel';
    String valorDropDownTipo = 'Seleccionar tipo';


    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0,),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 10.0,
      child: Form(
        key: _formKey,
        child: Column(
          children: [

            SizedBox( height: 30 ),

            //Nombre
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Juan Pérez',
                  labelText: 'Nombre',
                  prefixIcon: Icon(Icons.text_fields_rounded)
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar el nombre';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //Avatar
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'jperez8',
                  labelText: 'Avatar',
                  prefixIcon: Icon(Icons.text_fields_rounded)
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar el avatar';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //Usuario
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'miUsuario1',
                  labelText: 'Usuario',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar un usuario';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //Correo
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'correo@gmail.com',
                  labelText: 'Correo electrónico',
                  prefixIcon: Icon(Icons.alternate_email_rounded)
                ),
                validator: ( value ) {

                    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp  = RegExp(pattern);
                    
                    return regExp.hasMatch(value ?? '')
                      ? null
                      : 'Correo no válido';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //Contraseña
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: '*****',
                  labelText: 'Contraseña',
                  prefixIcon: Icon(Icons.lock_rounded)
                ),
                validator: ( value ) {

                    return ( value != null && value.length >= 6 ) 
                      ? null
                      : 'La contraseña debe contener 6 caracteres como mínimo';                                  
                    
                },
              ),
            ),

            SizedBox( height: 30 ),

            //Nivel
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: DropdownButtonFormField(
                value: valorDropDownNivel,
                icon: Icon(Icons.arrow_drop_down_circle_rounded),
                iconSize: 24,
                elevation: 16,
                onChanged: (String? newValue) {
                  setState(() {
                    valorDropDownNivel = newValue!;
                  });
                },
                items: <String>['Seleccionar nivel', '1', '2', '3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value){

                  return (value != 'Seleccionar nivel')
                      ? null
                      : 'Debes seleccionar un nivel';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //Tipo
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: DropdownButtonFormField(
                value: valorDropDownTipo,
                icon: Icon(Icons.arrow_drop_down_circle_rounded),
                iconSize: 24,
                elevation: 16,
                onChanged: (String? newValue) {
                  setState(() {
                    valorDropDownTipo = newValue!;
                  });
                },
                items: <String>['Seleccionar tipo', 'Alumno', 'Profesor', 'Admin']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value){

                  return (value != 'Seleccionar tipo')
                      ? null
                      : 'Debes seleccionar un tipo';

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
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  print('Valido');
                } else {
                  print('Invalido');
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