// ignore_for_file: non_constant_identifier_names, prefer_initializing_formals

class UsuarioModel{
  String avatar = '';
  String correo = ''; 
  int nivel = 0;
  String nombre = ''; 
  String password = '';
  String tipo = '';
  String usuario = '';

  UsuarioModel(String avatar, String correo, int nivel, String nombre, String password, String tipo, String usuario){
    this.avatar = avatar;
    this.correo = correo;
    this.nivel = nivel;
    this.nombre = nombre;
    this.password = password;
    this.tipo = tipo;
    this.usuario = usuario;
  }
}