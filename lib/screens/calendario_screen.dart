// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:parcial3_2506632017/providers/calendarios_provider.dart';

class CalendarioScreen extends StatelessWidget {
  const CalendarioScreen({Key? key}) : super(key: key);

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
      
                Text('Calendarios', style: TextStyle(color: Colors.white, fontSize: 45.0) ),
                SizedBox( height: 30.0 ),
                _CalendarioForm(),
                SizedBox( height: 30.0 ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CalendarioForm extends StatefulWidget {

  @override
  State<_CalendarioForm> createState() => _CalendarioFormState();
}

class _CalendarioFormState extends State<_CalendarioForm> {
  
  final _formKey = GlobalKey<FormState>();

  //Controladores
  final TextEditingController _nombre = TextEditingController();
  String _tipo = '';
  final TextEditingController _detalles = TextEditingController();
  final TextEditingController _fecha_ini = TextEditingController();
  final TextEditingController _fecha_fin = TextEditingController();
  final TextEditingController _hora_ini = TextEditingController();
  final TextEditingController _hora_fin = TextEditingController();
  final TextEditingController _idusuario = TextEditingController();
  final TextEditingController _img_fin = TextEditingController();
  final TextEditingController _img_ini = TextEditingController();

  String valorDropDownTipo = 'Seleccionar tipo';


  @override
  Widget build(BuildContext context) {

    CalendariosProvider calendariosProvider = CalendariosProvider();

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
                  hintText: 'Calendario 1',
                  labelText: 'Nombre Calendario',
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

            //Detalles
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: _detalles,
                autocorrect: false,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Detalles del calendario',
                  labelText: 'Detalles',
                  prefixIcon: Icon(Icons.text_fields_rounded)
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar los detalles';

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
                items: <String>['Seleccionar tipo', 'Examen', 'Evento', 'Asignacion', 'Alerta', 'Clase']
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

            //Fecha Inicio
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: _fecha_ini,
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: '2021-10-20',
                  labelText: 'Fecha Inicio',
                  prefixIcon: Icon(Icons.date_range_rounded)
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar la fecha de inicio';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //Fecha Fin
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: _fecha_fin,
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: '2021-10-21',
                  labelText: 'Fecha Fin',
                  prefixIcon: Icon(Icons.date_range_rounded)
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar la fecha fin';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //Hora Inicio
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: _hora_ini,
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: '13:55',
                  labelText: 'Hora Inicio',
                  prefixIcon: Icon(Icons.timer_rounded )
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar la hora de inicio';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //Hora Fin
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: _hora_fin,
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: '14:10',
                  labelText: 'Hora Fin',
                  prefixIcon: Icon(Icons.timer_rounded )
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar la hora fin';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //IdUsuario
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
                      : 'Debes ingresar un Id de Usuario';

                },
              ),
            ),

            //Imagen Inicio
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: _img_ini,
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Ruta de imagen',
                  labelText: 'Imagen Inicio',
                  prefixIcon: Icon(Icons.image_rounded )
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar la imagen de inicio';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //Imagen Fin
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: _img_fin,
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Ruta de imagen',
                  labelText: 'Imagen Fin',
                  prefixIcon: Icon(Icons.image_rounded )
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar la imagen fin';

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
                  bool r = await calendariosProvider.aggCalendario(_detalles.text, _fecha_fin.text, _fecha_ini.text, _hora_fin.text, _hora_ini.text, int.parse(_idusuario.text), 
                  _img_fin.text, _img_ini.text, _nombre.text, _tipo);

                  if(r){
                    //Si se guardó el usuario
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Guardando calendario'))
                    );

                    //Redirigimos a pantalla de consulta
                    Navigator.pushReplacementNamed(context, 'calendarios');
                  } else {
                    //Si no se guardó el usuario
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('No se pudo guardar el calendario'))
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