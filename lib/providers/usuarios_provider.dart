import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart' as cloud_firestore;
import 'package:parcial3_2506632017/models/usuario_model.dart';

class UsuariosProvider {
  final cloud_firestore.FirebaseFirestore _firestore = cloud_firestore.FirebaseFirestore.instance;

  //Agregar usuario
  Future<bool> aggUsuario(String avatar, String correo, int nivel, String nombre, String password, String tipo, String usuario) async {
    bool r = false;

    //Referencia a la colección 'usuarios'
    cloud_firestore.CollectionReference usuarios  = _firestore.collection('usuarios');

    try{
      
      //Registrar usuarui
      await usuarios.add({
        'avatar' : avatar,
        'correo' : correo,
        'nivel' : nivel,
        'nombre' : nombre,
        'password' : password,
        'tipo' : tipo,
        'usuario' : usuario,
      });
      //Si la subida salió bien se retorna 'true'
      return true;
      
    } on cloud_firestore.FirebaseException catch(e){
      //Si hubo error en la subida se retorna 'false'
      print(e);
      return false;

    }
  }

  //Actualizar usuario
  Future<bool> actUsuario(String idUsuario, String avatar, String correo, int nivel, String nombre, String password, String tipo, String usuario) async {
    bool r = false;

    //Referencia a la colección 'usuarios'
    cloud_firestore.CollectionReference usuarios  = _firestore.collection('usuarios');

    try{
      
      //Actualizar usuario
      await usuarios.doc(idUsuario).update({
        'avatar' : avatar,
        'correo' : correo,
        'nivel' : nivel,
        'nombre' : nombre,
        'password' : password,
        'tipo' : tipo,
        'usuario' : usuario,
      });
      //Si la subida salió bien se retorna 'true'
      return true;
      
    } on cloud_firestore.FirebaseException catch(e){
      //Si hubo error en la subida se retorna 'false'
      print(e);
      return false;

    }
  }

  //Obtener todos los usuarios
  Future<List<UsuarioModel>> getUsuarios() async {
    List<UsuarioModel> usuariosList = [];

    //Referencia a la colección 'usuarios'
    cloud_firestore.CollectionReference usuarios  = _firestore.collection('usuarios');

    final cloud_firestore.QuerySnapshot result = await usuarios.get();
    final List<cloud_firestore.DocumentSnapshot> documents = result.docs;
    
    for (var doc in documents) { 
      usuariosList.add(UsuarioModel(doc.reference.id, doc['avatar'], doc['correo'], doc['nivel'], doc['nombre'], doc['password'], doc['tipo'], doc['usuario']));
    }

    return usuariosList;
  }

  //Obtener un solo usuario
  Future<List<UsuarioModel>> getUsuario(String idUsuario) async {
    List<UsuarioModel> usuariosList = [];

    //Referencia a la colección 'usuarios'
    cloud_firestore.CollectionReference usuarios  = _firestore.collection('usuarios');

    final cloud_firestore.DocumentSnapshot doc = await usuarios.doc(idUsuario).get();
    
    usuariosList.add(UsuarioModel(doc.reference.id, doc['avatar'], doc['correo'], doc['nivel'], doc['nombre'], doc['password'], doc['tipo'], doc['usuario']));

    return usuariosList;
  }
}