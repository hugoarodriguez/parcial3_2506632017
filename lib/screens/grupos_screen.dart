// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:parcial3_2506632017/providers/grupos_provider.dart';

class GruposScreen extends StatefulWidget {
  const GruposScreen({Key? key}) : super(key: key);

  @override
  State<GruposScreen> createState() => _GruposScreenState();
}

class _GruposScreenState extends State<GruposScreen> {
  @override
  Widget build(BuildContext context) {

    GruposProvider gruposProvider = GruposProvider();

    return Container(
      color: Colors.deepOrange.shade700,
          child: FutureBuilder(
            future: gruposProvider.getGrupos(),
            builder: (context, snapshot){

              if(snapshot.hasData){
                final datos = snapshot.data;

                return _crearListViewDatos(context, datos, gruposProvider);
              } else if (snapshot.hasError) {
                return Center(child: CircularProgressIndicator());
              } else{
                return Center(child: CircularProgressIndicator());
              }

            },
          ),
    );
  }

  Widget _crearListViewDatos(BuildContext context, data, GruposProvider gruposProvider){
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
                      Text(items[i].nombre, style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold)),
                      Text(items[i].tipo, style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              onPressed: (){
    
                Navigator.pushNamed(context, 'grupo_edit', arguments: items[i].id);
    
              },
              onLongPress: (){
                gruposProvider.elmGrupo(items[i].id);
    
                setState(() { });
                
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.post_add_rounded),
        onPressed: () => Navigator.pushNamed(context, 'grupo_add'),
      ),
    );
  }
}