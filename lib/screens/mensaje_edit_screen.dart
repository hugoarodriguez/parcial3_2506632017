// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:parcial3_2506632017/models/mensaje_model.dart';
import 'package:parcial3_2506632017/providers/mensajes_provider.dart';

class MensajeEditScreen extends StatelessWidget {
  const MensajeEditScreen({Key? key}) : super(key: key);

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
      
                Text('Mensajes', style: TextStyle(color: Colors.white, fontSize: 45.0) ),
                SizedBox( height: 30.0 ),
                _MensajeEditForm(),
                SizedBox( height: 30.0 ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MensajeEditForm extends StatefulWidget {

  @override
  State<_MensajeEditForm> createState() => _MensajeEditFormState();
}

class _MensajeEditFormState extends State<_MensajeEditForm> {
  
  final _formKey = GlobalKey<FormState>();

 //Controladores
  final TextEditingController _fecha = TextEditingController();
  final TextEditingController _hora = TextEditingController();
  final TextEditingController _idgrupo = TextEditingController();
  final TextEditingController _idu_de = TextEditingController();
  final TextEditingController _idu_para = TextEditingController();
  final TextEditingController _mensaje = TextEditingController();
  final TextEditingController _tags = TextEditingController();
  final TextEditingController _titulo = TextEditingController();
  
  MensajesProvider mensajesProvider = MensajesProvider();
  
  String valorDropDownNivel = 'Seleccionar nivel';
  String valorDropDownTipo = 'Seleccionar tipo';



  @override
  Widget build(BuildContext context) {

    final idMensaje = ModalRoute.of(context)!.settings.arguments;

    return FutureBuilder(
      future: mensajesProvider.getMensaje(idMensaje.toString()),
      builder: (context, AsyncSnapshot<List<MensajeModel>> snapshot){

        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }

        if(snapshot.hasData){
          var datosMensaje = snapshot.data;

          _fecha.text = datosMensaje![0].fecha;
          _hora.text = datosMensaje[0].hora;
          _idgrupo.text = datosMensaje[0].idgrupo.toString();
          _idu_de.text = datosMensaje[0].idu_de.toString();
          _idu_para.text = datosMensaje[0].idu_para.toString();
          _mensaje.text = datosMensaje[0].mensaje;
          _tags.text = datosMensaje[0].tags;
          _titulo.text = datosMensaje[0].titulo;

          return mainContent(idMensaje.toString());
        }

        return Center(child: CircularProgressIndicator(),);
      }
    );
  }

  Widget mainContent(String idMensaje){
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0,),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 10.0,
      child: Form(
        key: _formKey,
        child: Column(
          children: [

            SizedBox( height: 30 ),

            //Título
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: _titulo,
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Mi título',
                  labelText: 'Título',
                  prefixIcon: Icon(Icons.text_fields_rounded)
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar un título';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //Mensaje
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: _mensaje,
                autocorrect: false,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Hola este es mi mensaje',
                  labelText: 'Mensaje',
                  prefixIcon: Icon(Icons.text_fields_rounded)
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar un mensaje';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //Tags
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: _tags,
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Mis tags',
                  labelText: 'Tags',
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

            

            //Fecha
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: _fecha,
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: '2021-10-20',
                  labelText: 'Fecha',
                  prefixIcon: Icon(Icons.date_range_rounded)
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar la fecha';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //Hora
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: _hora,
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: '13:55',
                  labelText: 'Hora',
                  prefixIcon: Icon(Icons.timer_rounded )
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar la hora';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //IdGrupo
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                controller: _idgrupo,
                autocorrect: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '1',
                  labelText: 'Id Grupo',
                  prefixIcon: Icon(Icons.format_list_numbered_outlined ),
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar un Id de grupo';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //IdDe
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                controller: _idu_de,
                autocorrect: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '1',
                  labelText: 'Id De',
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

            //IdPara
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                controller: _idu_para,
                autocorrect: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '1',
                  labelText: 'Id Para',
                  prefixIcon: Icon(Icons.format_list_numbered_outlined),
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar un Id de destinatario';

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
                  bool r = await mensajesProvider.actMensaje(idMensaje, _fecha.text, _hora.text, int.parse(_idgrupo.text), int.parse(_idu_de.text), 
                  int.parse(_idu_para.text), _mensaje.text, _tags.text, _titulo.text);

                  if(r){
                    //Si se guardó el mensaje
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Actualizando mensaje'))
                    );

                    //Redirigimos a pantalla de consulta
                    Navigator.pushReplacementNamed(context, 'mensajes');
                    
                  } else {
                    //Si no se guardó el mensaje
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('No se pudo guardar el mensaje'))
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