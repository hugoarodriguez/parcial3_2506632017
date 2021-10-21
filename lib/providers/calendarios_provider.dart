// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart' as cloud_firestore;
import 'package:parcial3_2506632017/models/calendario_model.dart';

class CalendariosProvider {
  final cloud_firestore.FirebaseFirestore _firestore = cloud_firestore.FirebaseFirestore.instance;

  //Agregar
  Future<bool> aggCalendario(String detalles, String fecha_fin, String fecha_ini, String hora_fin, String hora_ini, int idusuario, String img_fin, String img_ini, String nombre, String tipo) async {

    //Referencia a la colección 'calendarios'
    cloud_firestore.CollectionReference calendarios  = _firestore.collection('calendario');

    try{
      
      //Registrar
      await calendarios.add({
        'detalles'  : detalles,
        'fecha_fin' : fecha_fin,
        'fecha_ini' : fecha_ini,
        'hora_fin' : hora_fin,
        'hora_ini' : hora_ini,
        'idusuario' : idusuario,
        'img_fin' : img_fin,
        'img_ini' : img_ini,
        'nombre' : nombre,
        'tipo' : tipo,
      });
      //Si la subida salió bien se retorna 'true'
      return true;
      
    } on cloud_firestore.FirebaseException catch(e){
      //Si hubo error en la subida se retorna 'false'
      print(e);
      return false;

    }
  }

  //Actualiza
  Future<bool> actCalendario(String idCalendario, String detalles, String fecha_fin, String fecha_ini, String hora_fin, String hora_ini, int idusuario, String img_fin, String img_ini, String nombre, String tipo) async {
    
    //Referencia a la colección 'calendarios'
    cloud_firestore.CollectionReference calendarios  = _firestore.collection('calendario');

    try{
      
      //Actualizar
      await calendarios.doc(idCalendario).update({
        'detalles'  : detalles,
        'fecha_fin' : fecha_fin,
        'fecha_ini' : fecha_ini,
        'hora_fin' : hora_fin,
        'hora_ini' : hora_ini,
        'idusuario' : idusuario,
        'img_fin' : img_fin,
        'img_ini' : img_ini,
        'nombre' : nombre,
        'tipo' : tipo,
      });
      //Si la subida salió bien se retorna 'true'
      return true;
      
    } on cloud_firestore.FirebaseException catch(e){
      //Si hubo error en la subida se retorna 'false'
      print(e);
      return false;

    }
  }

  //Eliminar
  Future<bool> elmCalendario(String idCalendario) async {

    //Referencia a la colección 'calendario'
    cloud_firestore.CollectionReference calendarios  = _firestore.collection('calendario');

    try{
      
      //Eliminar
      await calendarios.doc(idCalendario).delete();
      //Si la eliminación salió bien se retorna 'true'
      return true;
      
    } on cloud_firestore.FirebaseException catch(e){
      //Si hubo error en la subida se retorna 'false'
      print(e);
      return false;

    }
  }

  //Obtener todos los calendarios
  Future<List<CalendarioModel>> getCalendarios() async {
    List<CalendarioModel> calendariosList = [];

    //Referencia a la colección 'caelndario'
    cloud_firestore.CollectionReference calendarios  = _firestore.collection('calendario');

    final cloud_firestore.QuerySnapshot result = await calendarios.get();
    final List<cloud_firestore.DocumentSnapshot> documents = result.docs;
    
    for (var doc in documents) { 
      calendariosList.add(CalendarioModel(doc.reference.id, doc['detalles'], doc['fecha_fin'], doc['fecha_ini'], doc['hora_fin'], doc['hora_ini'], doc['idusuario'], doc['img_fin'], doc['img_ini'], doc['nombre'], doc['tipo']));
    }

    return calendariosList;
  }

  //Obtener un solo calendario
  Future<List<CalendarioModel>> getCalendario(String idCalendario) async {
    List<CalendarioModel> calendariosList = [];

    //Referencia a la colección 'calendario'
    cloud_firestore.CollectionReference calendarios  = _firestore.collection('calendario');

    final cloud_firestore.DocumentSnapshot doc = await calendarios.doc(idCalendario).get();
    
    calendariosList.add(CalendarioModel(doc.reference.id, doc['detalles'], doc['fecha_fin'], doc['fecha_ini'], doc['hora_fin'], doc['hora_ini'], doc['idusuario'], doc['img_fin'], doc['img_ini'], doc['nombre'], doc['tipo']));

    return calendariosList;
  }
}