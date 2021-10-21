// ignore_for_file: non_constant_identifier_names, prefer_initializing_formals

class CalendarioModel{
  String id = '';
  String detalles = '';
  String fecha_fin = '';
  String fecha_ini = '';
  String hora_fin = '';
  String hora_ini = '';
  int idusuario = 0; 
  String img_fin = ''; 
  String img_ini = '';
  String nombre = '';
  String tipo = '';

  CalendarioModel(String id, String detalles, String fecha_fin, String fecha_ini, String hora_fin, String hora_ini, int idusuario, String img_fin, String img_ini, String nombre, String tipo){
    this.id = id;
    this.detalles = detalles;
    this.fecha_fin = fecha_fin;
    this.fecha_ini = fecha_ini;
    this.hora_fin = hora_fin;
    this.hora_ini = hora_ini;
    this.idusuario = idusuario;
    this.img_fin = img_fin;
    this.img_ini = img_ini;
    this.nombre = nombre;
    this.tipo = tipo;
  }
}