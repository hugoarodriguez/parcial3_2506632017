// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:parcial3_2506632017/models/usuario_model.dart';
import 'package:parcial3_2506632017/providers/usuarios_provider.dart';

class UsuarioEditScreen extends StatelessWidget {
  const UsuarioEditScreen({Key? key}) : super(key: key);

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
                _UsuarioEditForm(),
                SizedBox( height: 30.0 ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UsuarioEditForm extends StatefulWidget {

  @override
  State<_UsuarioEditForm> createState() => _UsuarioEditFormState();
}

class _UsuarioEditFormState extends State<_UsuarioEditForm> {
  
  final _formKey = GlobalKey<FormState>();

  //Controladores
  final TextEditingController _nombre = TextEditingController();
  final TextEditingController _avatar = TextEditingController();
  final TextEditingController _correo = TextEditingController();
  final TextEditingController _usuario = TextEditingController();
  final TextEditingController _password = TextEditingController();
  int _nivel = 0;
  String _tipo = '';
  
  UsuariosProvider usuariosProvider = UsuariosProvider();
  
  String valorDropDownNivel = 'Seleccionar nivel';
  String valorDropDownTipo = 'Seleccionar tipo';



  @override
  Widget build(BuildContext context) {

    final idUsuario = ModalRoute.of(context)!.settings.arguments;

    return FutureBuilder(
      future: usuariosProvider.getUsuario(idUsuario.toString()),
      builder: (context, AsyncSnapshot<List<UsuarioModel>> snapshot){

        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }

        if(snapshot.hasData){
          var datosUsuario = snapshot.data;

          _nombre.text = datosUsuario![0].nombre;
          _avatar.text = datosUsuario[0].avatar;
          _usuario.text = datosUsuario[0].usuario;
          _correo.text = datosUsuario[0].correo;
          _password.text = datosUsuario[0].password;
          valorDropDownNivel = datosUsuario[0].nivel.toString();
          valorDropDownTipo = datosUsuario[0].tipo;

          return mainContent(idUsuario.toString());
        }

        return Center(child: CircularProgressIndicator(),);
      }
    );
  }

  Widget mainContent(String idUsuario){
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
                controller: _nombre,
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
                controller: _avatar,
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
                controller: _usuario,
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
                controller: _correo,
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
                controller: _password,
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

                  if(int.tryParse(value.toString()) != null){
                    _nivel = int.parse(value.toString());
                  }
                  

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

                  _tipo = value.toString();

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
                child: Text('Actualizar',style: TextStyle( color: Colors.white ),
                )
              ),
              onPressed: () async {
                
                if(_formKey.currentState!.validate()){
                  bool r = await usuariosProvider.actUsuario(idUsuario.toString(), _avatar.text, _correo.text, _nivel, _nombre.text, _password.text, 
                  _tipo, _usuario.text);

                  if(r){
                    //Si se guardó el usuario
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Actualizando usuario'))
                    );
                  } else {
                    //Si no se guardó el usuario
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('No se pudo guardar el usuario'))
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