// ignore_for_file: non_constant_identifier_names, prefer_initializing_formals

class MensajeModel{
  String id = '';
  String fecha = '';
  String hora = '';
  int idGrupo = 0; 
  int idm = 0;
  int idu_de = 0; 
  int idu_para = 0;
  String mensaje = '';
  String tags = '';
  String titulo = '';

  MensajeModel(String id, String fecha, String hora, int idGrupo, int idm, int idu_de, int idu_para, String mensaje, String tags, String titulo){
    this.id = id;
    this.fecha = fecha;
    this.hora = hora;
    this.idGrupo = idGrupo;
    this.idm = idm;
    this.idu_de = idu_de;
    this.idu_para = idu_para;
    this.mensaje = mensaje;
    this.tags = tags;
    this.titulo = titulo;
  }
}