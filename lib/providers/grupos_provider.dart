// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart' as cloud_firestore;
import 'package:parcial3_2506632017/models/grupo_model.dart';

class GruposProvider {
  final cloud_firestore.FirebaseFirestore _firestore = cloud_firestore.FirebaseFirestore.instance;

  //Agregar
  Future<bool> aggGrupo(int idusuario, String nombre, bool publico, String tipo) async {

    //Referencia a la colección 'grupos'
    cloud_firestore.CollectionReference grupos  = _firestore.collection('grupos');

    try{
      
      //Registrar
      await grupos.add({
        'idusuario' : idusuario,
        'nombre' : nombre,
        'publico' : publico,
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
  Future<bool> actGrupo(String idGrupo, int idusuario, String nombre, bool publico, String tipo) async {
    
    //Referencia a la colección 'grupos'
    cloud_firestore.CollectionReference grupos  = _firestore.collection('grupos');

    try{
      
      //Actualizar
      await grupos.doc(idGrupo).update({
        'idusuario' : idusuario,
        'nombre' : nombre,
        'publico' : publico,
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
  Future<bool> elmGrupo(String idGrupo) async {

    //Referencia a la colección 'grupos'
    cloud_firestore.CollectionReference grupos  = _firestore.collection('grupos');

    try{
      
      //Eliminar
      await grupos.doc(idGrupo).delete();
      //Si la eliminación salió bien se retorna 'true'
      return true;
      
    } on cloud_firestore.FirebaseException catch(e){
      //Si hubo error en la subida se retorna 'false'
      print(e);
      return false;

    }
  }

  //Obtener todos los grupos
  Future<List<GrupoModel>> getGrupos() async {
    List<GrupoModel> gruposList = [];

    //Referencia a la colección 'grupos'
    cloud_firestore.CollectionReference grupos  = _firestore.collection('grupos');

    final cloud_firestore.QuerySnapshot result = await grupos.get();
    final List<cloud_firestore.DocumentSnapshot> documents = result.docs;
    
    for (var doc in documents) { 
      gruposList.add(GrupoModel(doc.reference.id, doc['idusuario'], doc['nombre'], doc['publico'], doc['tipo']));
    }

    return gruposList;
  }

  //Obtener un solo grupos
  Future<List<GrupoModel>> getGrupo(String idGrupo) async {
    List<GrupoModel> gruposList = [];

    //Referencia a la colección 'grupos'
    cloud_firestore.CollectionReference grupos  = _firestore.collection('grupos');

    final cloud_firestore.DocumentSnapshot doc = await grupos.doc(idGrupo).get();
    
    gruposList.add(GrupoModel(doc.reference.id, doc['idusuario'], doc['nombre'], doc['publico'], doc['tipo']));

    return gruposList;
  }
}