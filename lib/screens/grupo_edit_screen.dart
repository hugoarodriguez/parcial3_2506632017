// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:parcial3_2506632017/models/grupo_model.dart';
import 'package:parcial3_2506632017/providers/grupos_provider.dart';

class GrupoEditScreen extends StatelessWidget {
  const GrupoEditScreen({Key? key}) : super(key: key);

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
      
                Text('Grupos', style: TextStyle(color: Colors.white, fontSize: 45.0) ),
                SizedBox( height: 30.0 ),
                _GrupoEditForm(),
                SizedBox( height: 30.0 ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GrupoEditForm extends StatefulWidget {

  @override
  State<_GrupoEditForm> createState() => _GrupoEditFormState();
}

class _GrupoEditFormState extends State<_GrupoEditForm> {
  
  final _formKey = GlobalKey<FormState>();

 //Controladores
  final TextEditingController _idusuario = TextEditingController();
  final TextEditingController _nombre = TextEditingController();
  bool _publico = false;
  String _tipo = '';
  
  GruposProvider gruposProvider = GruposProvider();

  String valorDropDownNivel = 'Seleccionar nivel';
  String valorDropDownTipo = 'Seleccionar tipo';



  @override
  Widget build(BuildContext context) {

    final idGrupo = ModalRoute.of(context)!.settings.arguments;

    return FutureBuilder(
      future: gruposProvider.getGrupo(idGrupo.toString()),
      builder: (context, AsyncSnapshot<List<GrupoModel>> snapshot){

        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }

        if(snapshot.hasData){
          var datosGrupo = snapshot.data;

          _idusuario.text = datosGrupo![0].idusuario.toString();
          _nombre.text = datosGrupo[0].nombre;
          _publico = datosGrupo[0].publico;
          _tipo = datosGrupo[0].tipo;

          valorDropDownNivel = (_publico == true) ? 'Publico' : 'Oculto';
          valorDropDownTipo = _tipo;

          return mainContent(idGrupo.toString());
        }

        return Center(child: CircularProgressIndicator(),);
      }
    );
  }

  Widget mainContent(String idGrupo){
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
                  hintText: 'Grupo 1',
                  labelText: 'Nombre de Grupo',
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
                items: <String>['Seleccionar nivel', 'Publico', 'Oculto']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value){

                  if(value.toString() == 'Publico'){
                    _publico = true;
                  } else {
                    _publico = false;
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
                items: <String>['Seleccionar tipo', 'Curso', 'Tablon']
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
                  bool r = await gruposProvider.actGrupo(idGrupo, int.parse( _idusuario.text), _nombre.text, _publico, _tipo);

                  if(r){
                    //Si se guardó el grupo
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Actualizando grupo'))
                    );

                    //Redirigimos a pantalla de consulta
                    Navigator.pushReplacementNamed(context, 'grupos');
                    
                  } else {
                    //Si no se guardó el grupo
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('No se pudo guardar la grupo'))
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