// ignore_for_file: non_constant_identifier_names, prefer_initializing_formals

class GrupoModel{
  String id = '';
  int idusuario = 0;
  String nombre = '';
  bool publico = false;
  String tipo = '';

  GrupoModel(String id, int idusuario, String nombre, bool publico, String tipo){
    this.id = id;
    this.idusuario = idusuario;
    this.nombre = nombre;
    this.publico = publico;
    this.tipo = tipo;
  }
}