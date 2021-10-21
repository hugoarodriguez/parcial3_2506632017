// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart' as cloud_firestore;
import 'package:parcial3_2506632017/models/configuracion_model.dart';

class ConfiguracionesProvider {
  final cloud_firestore.FirebaseFirestore _firestore = cloud_firestore.FirebaseFirestore.instance;

  //Agregar
  Future<bool> aggConfiguracion(int idusuario, String nombre, String valor) async {

    //Referencia a la colección 'configuracion'
    cloud_firestore.CollectionReference configuraciones  = _firestore.collection('configuracion');

    try{
      
      //Registrar
      await configuraciones.add({
        'idusuario' : idusuario,
        'nombre' : nombre,
        'valor' : valor,
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
  Future<bool> actConfiguracion(String idConfiguracion, int idusuario, String nombre, String valor) async {
    
    //Referencia a la colección 'configuracion'
    cloud_firestore.CollectionReference configuraciones  = _firestore.collection('configuracion');

    try{
      
      //Actualizar
      await configuraciones.doc(idConfiguracion).update({
        'idusuario' : idusuario,
        'nombre' : nombre,
        'valor' : valor,
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
  Future<bool> elmConfiguracion(String idConfiguracion) async {

    //Referencia a la colección 'configuracion'
    cloud_firestore.CollectionReference configuraciones  = _firestore.collection('configuracion');

    try{
      
      //Eliminar
      await configuraciones.doc(idConfiguracion).delete();
      //Si la eliminación salió bien se retorna 'true'
      return true;
      
    } on cloud_firestore.FirebaseException catch(e){
      //Si hubo error en la subida se retorna 'false'
      print(e);
      return false;

    }
  }

  //Obtener todos los mensajes
  Future<List<ConfiguracionModel>> getConfiguraciones() async {
    List<ConfiguracionModel> mensajesList = [];

    //Referencia a la colección 'configuracion'
    cloud_firestore.CollectionReference configuraciones  = _firestore.collection('configuracion');

    final cloud_firestore.QuerySnapshot result = await configuraciones.get();
    final List<cloud_firestore.DocumentSnapshot> documents = result.docs;
    
    for (var doc in documents) { 
      mensajesList.add(ConfiguracionModel(doc.reference.id, doc['idusuario'], doc['nombre'], doc['valor']));
    }

    return mensajesList;
  }

  //Obtener un solo mensaje
  Future<List<ConfiguracionModel>> getConfiguracion(String idConfiguracion) async {
    List<ConfiguracionModel> mensajesList = [];

    //Referencia a la colección 'configuracion'
    cloud_firestore.CollectionReference configuraciones  = _firestore.collection('configuracion');

    final cloud_firestore.DocumentSnapshot doc = await configuraciones.doc(idConfiguracion).get();
    
    mensajesList.add(ConfiguracionModel(doc.reference.id, doc['idusuario'], doc['nombre'], doc['valor']));

    return mensajesList;
  }
}