import 'package:dart_aprendiendo/dart_aprendiendo.dart' as dart_aprendiendo;
import 'dart:convert';

void main() {
//   Números
  int empleados = 10;
  double pi = 3.141592;
  var numero = 1.0;
  print('$empleados - $pi - $numero');

//   String - Cadena de caracteres
  String nombre = 'Tony';
  print(nombre);
  print(nombre[0]);
  print(nombre[nombre.length - 1]);

//   Booleanos y condiciones
  bool activado = true;
  print(activado);
  if (!activado) {
    print('El motor está funcionando');
  } else {
    print('Está apagado');
  }

//   Listas
  List<int> numeros = [1, 2, 3, 4, 5];
  print(numeros);
  numeros.add(6);
  print(numeros);
//   Tamaño fijo
  List masNumeros = List(10);
  print(masNumeros);
  masNumeros[0] = 1;
  print(masNumeros);

// Map
  String propiedad = 'soltero';
  Map<String, dynamic> persona = {
    'nombre': 'Carlos',
    'edad': 32,
    'soltero': true
  };
  print(persona['nombre']);
  print(persona['edad']);
  print(persona[propiedad]);
  Map<int, String> personas = {1: 'Tony', 2: 'Peter', 9: 'Strange'};
  personas.addAll({4: 'Banner'});
  print(personas);
  print(personas[2]);

//   Funciones
  String mensaje = saludar(nombre: 'Fernando', texto: 'Hola');
  print(mensaje);

//   Clases
  final wolverine = new Heroe(poder: 'Regeneración', nombre: 'Logan');
  print(wolverine);

//   Constructores con nombre
  final rawJson = '{"nombre": "Logan", "poder": "Regeneración"}';
  Map parsedJson = json.decode(rawJson);
  final wolverine = new Heroe3.fromJson(parsedJson);

//   Getters & Setters
  final cuadrado = new Cuadrado();
  cuadrado.lado = 10;
  print(cuadrado);
  print('Área: ${cuadrado.area}');

//   Clases Abstractas
  final perro = new Perro();
  perro.emitirSonido();
  final gato = new Gato();
  gato.emitirSonido();

//   Extends
  final superman = new Heroe();
  superman.nombre = 'Clark Kent';
  final luthor = new Villano();
  luthor.nombre = 'Lex Luthor';

//   Mixins
  final pato = new Pato();
  pato.volar();
  final pezVolador = new PezVolador();
  pezVolador.nadar();

//   Futures
  print('Estamos a punto de pedir datos');
  httpGet('https://api.nada.com/aliens').then((data) {
    print(data);
  });
  print('Última línea');

//   Async - Await
  void main() async {
    String data = await httpGet('https://api.nada.com/aliens');
    print(data);
    print('Última Línea');
  }
}

// Funciones
String saludar({String texto = '', String nombre = ''}) {
//   print('Hola');
  return '$texto $nombre';
}

String saludar2({String texto = '', String nombre = ''}) => '$texto $nombre';

// Clases
class Heroe {
  String nombre;
  String poder;
  Heroe({String nombre = '', String poder = ''}) {
    this.nombre = nombre;
    this.poder = poder;
  }
  String toString() => 'nombre: ${this.nombre} - poder: ${this.poder}';
}

class Heroe2 {
  String nombre;
  String poder;
  Heroe2(this.nombre, this.poder);
  String toString() => 'nombre: $nombre - poder: $poder';
}

//   Constructores con nombre
class Heroe3 {
  String nombre;
  String poder;
  Heroe3(this.nombre, this.poder);
  Heroe3.fromJson(Map parsedJson) {
    nombre = parsedJson['nombre'];
    poder = parsedJson['poder'];
  }
}

//   Getters & Setters
class Cuadrado {
  double _lado;
  set lado(double valor) {
    if (valor <= 0) {
      throw ('El lado no puede ser menor o igual a 0');
    } else {
      _lado = valor;
    }
  }

  double get area => _lado * _lado;

  toString() => 'Lado: $_lado';
}

//   Clases Abstractas
abstract class Animal {
  int patas;
  void emitirSonido();
}

class Perro implements Animal {
  int patas;
  int colas;
  void emitirSonido() => print('GUAUUUUU!!');
}

class Gato implements Animal {
  int patas;
  void emitirSonido() => print('MIAUUUUU!!');
}

//   Extends
abstract class Personaje {
  String nombre;
  String poder;
}

class Heroe extends Personaje {
  int valentia;
}

class Villano extends Personaje {
  int maldad;
}

// Mixins
abstract class Animal {}

abstract class Mamifero extends Animal {}

abstract class Ave extends Animal {}

abstract class Pez extends Animal {}

abstract class Volador {
  void volar() => print('Estoy volando!!');
}

abstract class Nadador {
  void nadar() => print('Estoy nadando!!');
}

abstract class Caminador {
  void caminar() => print('Estoy caminando');
}

class Delfin extends Mamifero with Nadador {}

class Murcielago extends Mamifero with Caminador, Volador {}

class Gato extends Mamifero with Caminador {}

class Paloma extends Ave with Caminador, Volador {}

class Pato extends Ave with Caminador, Volador, Nadador {}

class PezVolador extends Pez with Nadador, Volador {}

//   Futures
Future<String> httpGet(String url) {
  return Future.delayed(new Duration(seconds: 4), () {
    return 'Hola Mundo';
  });
}
