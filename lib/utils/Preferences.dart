
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _preferences;

  static String _token = "";

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  //user id
  static String get token {
    return _preferences.getString("token") ?? _token;
  }

  static set token(String value) {
    _token = value;
    _preferences.setString("token", value);
  }
}

// color base claro: Color.fromARGB(255, 255, 240, 217), Color.fromARGB(225, 255, 152, 0) fonfo logo rgba(255, 246, 243, 234)

final platillosGeneral = [
  {"ID":"1", "DIA" : "Lunes", "NOMBRE":"Pasta Poblana", "DESC":"pasta en crema poblana, rajitas poblanas, granos de elote y pollo", "COSTO":"120"},
  {"ID":"2", "DIA" : "Lunes", "NOMBRE":"Sincronizadas ", "DESC":"Tortilla de harina con queso Oaxaca, jamón y queso manchego", "COSTO":"100"},
  {"ID":"3", "DIA" : "Lunes", "NOMBRE":"Sándwich verde ", "DESC":"amón de pavo, queso panela, espinaca, germen, lechuga", "COSTO":"100"},
  {"ID":"4", "DIA" : "Lunes", "NOMBRE":"Ensalada Cherry", "DESC":"", "COMPLEMEMTO":"Lechugas mixtas, jitomates Cherry, pepino, pollo a la plancha, queso panela, crotones", "COSTO":"120"},
  {"ID":"5", "DIA" : "Lunes", "NOMBRE":"Ensalada de frutos secos", "DESC":"Mix de lechugas, cacahuate, almendras, nuez, arándanos y pollo", "COSTO":"120"},
  //{"ID":"6", "DIA" : "Martes", "NOMBRE":"Cóctel de frutas", "DESC":"Sandia, melón y piña acompañado de granola, yogurt natural o de fresa", "COSTO":"90"},
  //{"ID":"7", "DIA" : "Martes", "NOMBRE":"Burrito de tinga", "DESC":"frijoles, queso manchego, tinga de pollo", "COSTO":"100"},
  //{"ID":"8", "DIA" : "Martes", "NOMBRE":"Cuernito de carnes frías", "DESC":"Pierna, jamón, pepperoni, queso manchego y chipotle", "COSTO":"100"},
  //{"ID":"9", "DIA" : "Martes", "NOMBRE":"Sándwich de atún", "DESC":"Atún preparado a la mexicana, lechuga, aguacate", "COSTO":"100"},
  //{"ID":"10", "DIA" : "Martes", "NOMBRE":"Ensalada tex", "DESC":"Mix de lechugas, pollo a la plancha, granos de elote, queso panela y tiritas de tortilla con pico de gallo", "COSTO":"130"},
  //{"ID":"11", "DIA" : "Miercoles", "NOMBRE":"Burrito de rajitas poblanas", "DESC":"rajas poblanas en crema, pollo, queso manchego y frijoles", "COSTO":"130"},
  //{"ID":"12", "DIA" : "Miercoles", "NOMBRE":"Sándwich de pollo a la pimienta y limón", "DESC":"pollo a la pimienta y limón, lechuga, jitomate, cebolla morada y queso panela", "COSTO":"120"},
  //{"ID":"13", "DIA" : "Miercoles", "NOMBRE":"Sándwich de quesos", "DESC":"Queso manchego, queso Oaxaca, queso americano, queso panela, jamón, pierna y aguacate", "COSTO":"120"},
  //{"ID":"14", "DIA" : "Miercoles", "NOMBRE":"Ensalada de espinaca", "DESC":"Mix de lechugas, espinaca, nuez, arándanos, y pollo", "COSTO":"100"},
  //{"ID":"15", "DIA" : "Miercoles", "NOMBRE":"Ensalada con pasta", "DESC":"Cama de lechuga, pasta preparada con crema de queso de cabra, nuez, almendra y aguacate", "COSTO":"130"},
  //{"ID":"16", "DIA" : "Jueves", "NOMBRE":"Torta de salchicha", "DESC":"Salchicha, queso Oaxaca, queso manchego, jitomate, lechuga y salsa de chipotle", "COSTO":"110"},
  //{"ID":"17", "DIA" : "Jueves", "NOMBRE":"Hot cakes", "DESC":"con fresas", "COSTO":"100"},
  //{"ID":"18", "DIA" : "Jueves", "NOMBRE":"Sándwich de tocino", "DESC":"Jamón de pavo, tocino, queso manchego, jitomate", "COSTO":"100"},
  //{"ID":"19", "DIA" : "Jueves", "NOMBRE":"Ensalada de jícama", "DESC":"Mix de lechugas, jícama rayada, cacahuates, jitomate cherry, y pollo", "COSTO":"110"},
  //{"ID":"20", "DIA" : "Jueves", "NOMBRE":"Ensalada de huevo", "DESC":"Mix de lechugas, huevo cocido, aceitunas, aguacate, crotones y pollo", "COSTO":"120"},
  //{"ID":"21", "DIA" : "Viernes", "NOMBRE":"Chilaquiles suizos", "DESC":"Chilaquiles de salsa suiza con pollo o bistec", "COSTO":"110"},
  //{"ID":"22", "DIA" : "Viernes", "NOMBRE":"Cóctel de frutas", "DESC":"Sandia, melón y piña acompañado de granola, yogurt natural o de fresa", "COSTO":"90"},
  //{"ID":"23", "DIA" : "Viernes", "NOMBRE":"Bísquet dulce con durazno", "DESC":"Bísquet preparado con crema y duraznos en almíbar", "COSTO":"100"},
  //{"ID":"24", "DIA" : "Viernes", "NOMBRE":"Ensalada de pollo picante", "DESC":"Mix de lechugas, pollo picante, queso panela, cebolla morada", "COSTO":"120"},
  //{"ID":"25", "DIA" : "Viernes", "NOMBRE":"Ensalada de piña ", "DESC":"Mix de lechuga, piña asada, pepino rayado, almendras y pollo", "COSTO":"120"},
  ];

  final porTemporada = [
    {"ID":"1", "NOMBRE":"pan de muerto", "DESC":"Pan relleno con crema y fruta", "COMPLEMEMTO":"", "COSTO":"100"},
    ];
  final promocion = [
    {"ID":"1", "NOMBRE":"arroz con leche con crema", "DESC":"", "COSTO":"70"},
    ];
  final extras = [
    {"ID":"1", "NOMBRE":"Fruta ", "DESC":"Mix de fruta", "COMPLEMEMTO":"", "COSTO":"10"},
    ];
