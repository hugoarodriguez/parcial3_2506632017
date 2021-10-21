// ignore_for_file: non_constant_identifier_names, prefer_initializing_formals

class ConfiguracionModel{
  String id = '';
  int idusuario = 0;
  String nombre = '';
  String valor = '';

  ConfiguracionModel(String id, int idusuario, String nombre, String valor){
    this.id = id;
    this.idusuario = idusuario;
    this.nombre = nombre;
    this.valor = valor;
  }
}