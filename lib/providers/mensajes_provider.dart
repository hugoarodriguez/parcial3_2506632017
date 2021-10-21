// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart' as cloud_firestore;
import 'package:parcial3_2506632017/models/mensaje_model.dart';

class MensajesProvider {
  final cloud_firestore.FirebaseFirestore _firestore = cloud_firestore.FirebaseFirestore.instance;

  //Agregar
  Future<bool> aggMensaje(String fecha, String hora, int idgrupo, int idu_de, int idu_para, String mensaje, String tags, String titulo) async {

    //Referencia a la colección 'mensaje'
    cloud_firestore.CollectionReference mensajes  = _firestore.collection('mensajes');

    try{
      
      //Registrar
      await mensajes.add({
        'fecha' : fecha,
        'hora' : hora,
        'idgrupo' : idgrupo,
        'idu_de' : idu_de,
        'idu_para' : idu_para,
        'mensaje' : mensaje,
        'tags' : tags,
        'titulo' : titulo,
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
  Future<bool> actMensaje(String idMensaje, String fecha, String hora, int idgrupo, int idu_de, int idu_para, String mensaje, String tags, String titulo) async {
    
    //Referencia a la colección 'mensajes'
    cloud_firestore.CollectionReference mensajes  = _firestore.collection('mensajes');

    try{
      
      //Actualizar
      await mensajes.doc(idMensaje).update({
        'fecha' : fecha,
        'hora' : hora,
        'idgrupo' : idgrupo,
        'idu_de' : idu_de,
        'idu_para' : idu_para,
        'mensaje' : mensaje,
        'tags' : tags,
        'titulo' : titulo,
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
  Future<bool> elmMensaje(String idMensajes) async {

    //Referencia a la colección 'mensajes'
    cloud_firestore.CollectionReference mensajes  = _firestore.collection('mensajes');

    try{
      
      //Eliminar
      await mensajes.doc(idMensajes).delete();
      //Si la eliminación salió bien se retorna 'true'
      return true;
      
    } on cloud_firestore.FirebaseException catch(e){
      //Si hubo error en la subida se retorna 'false'
      print(e);
      return false;

    }
  }

  //Obtener todos los mensajes
  Future<List<MensajeModel>> getMensajes() async {
    List<MensajeModel> mensajesList = [];

    //Referencia a la colección 'mensajes'
    cloud_firestore.CollectionReference mensajes  = _firestore.collection('mensajes');

    final cloud_firestore.QuerySnapshot result = await mensajes.get();
    final List<cloud_firestore.DocumentSnapshot> documents = result.docs;
    
    for (var doc in documents) { 
      mensajesList.add(MensajeModel(doc.reference.id, doc['fecha'], doc['hora'], doc['idgrupo'], doc['idu_de'], doc['idu_para'], doc['mensaje'], doc['tags'], doc['titulo']));
    }

    return mensajesList;
  }

  //Obtener un solo mensaje
  Future<List<MensajeModel>> getMensaje(String idMensaje) async {
    List<MensajeModel> mensajesList = [];

    //Referencia a la colección 'mensajes'
    cloud_firestore.CollectionReference mensajes  = _firestore.collection('mensajes');

    final cloud_firestore.DocumentSnapshot doc = await mensajes.doc(idMensaje).get();
    
    mensajesList.add(MensajeModel(doc.reference.id, doc['fecha'], doc['hora'], doc['idgrupo'], doc['idu_de'], doc['idu_para'], doc['mensaje'], doc['tags'], doc['titulo']));

    return mensajesList;
  }
}