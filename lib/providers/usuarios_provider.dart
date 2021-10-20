import 'package:cloud_firestore/cloud_firestore.dart' as cloud_firestore;

class UsuariosProvider {
  final cloud_firestore.FirebaseFirestore _firestore = cloud_firestore.FirebaseFirestore.instance;

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
}