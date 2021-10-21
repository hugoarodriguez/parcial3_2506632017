// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:parcial3_2506632017/providers/mensajes_provider.dart';

class MensajesScreen extends StatefulWidget {
  const MensajesScreen({Key? key}) : super(key: key);

  @override
  State<MensajesScreen> createState() => _MensajesScreenState();
}

class _MensajesScreenState extends State<MensajesScreen> {
  @override
  Widget build(BuildContext context) {

    MensajesProvider mensajesProvider = MensajesProvider();

    return Container(
      color: Colors.deepOrange.shade700,
          child: FutureBuilder(
            future: mensajesProvider.getMensajes(),
            builder: (context, snapshot){

              if(snapshot.hasData){
                final datos = snapshot.data;

                return _crearListViewDatos(context, datos, mensajesProvider);
              } else if (snapshot.hasError) {
                return Center(child: CircularProgressIndicator());
              } else{
                return Center(child: CircularProgressIndicator());
              }

            },
          ),
    );
  }

  Widget _crearListViewDatos(BuildContext context, data, MensajesProvider mensajesProvider){
    List items = data;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pushReplacementNamed(context, 'home_screen'),
            ),
            Text('Toca rápidamente una vez para editar\n manten presionado para eliminar', style: TextStyle(fontSize: 12.0),),
            SizedBox(width: 10.0,)
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) => Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.deepOrange.shade200,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0)
                )
              ]
            ),
            child: TextButton(
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(items[i].titulo, style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold)),
                      Text(items[i].mensaje, style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              onPressed: (){
    
                Navigator.pushNamed(context, 'mensaje_edit', arguments: items[i].id);
    
              },
              onLongPress: (){
                mensajesProvider.elmMensaje(items[i].id);
    
                setState(() { });
                
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.post_add_rounded),
        onPressed: () => Navigator.pushNamed(context, 'mensaje_add'),
      ),
    );
  }
}