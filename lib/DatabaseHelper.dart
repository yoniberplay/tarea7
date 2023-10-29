import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tarea7/Tareas.dart';

class DB {
  static Future<Database> _openDB() async {
    try {
      return openDatabase(join(await getDatabasesPath(), 'tareas.db'),
          onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE IF NOT EXISTS tareas(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT, isCompleted INTEGER  )",
        );
      }, version: 3);
    } catch (e) {
      print('Error al abrir la base de datos: $e');
      throw e;
    }
  }

  static Future<void> insert(Tareas tareas) async {
    Database database = await _openDB();

    database.insert("tareas", tareas.toMap());
  }

  static Future<void> delete(Tareas tareas) async {
    Database database = await _openDB();
    database.delete("tareas", where: "id = ?", whereArgs: [tareas.id]);
  }

  static Future<void> update(Tareas tareas) async {
    Database database = await _openDB();

    database.update("tareas", tareas.toMap(),
        where: "id = ?", whereArgs: [tareas.id]);
  }

  static Future<List<Tareas>> tareas() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> tareasMap = await database.query("tareas");

    return List.generate(
        tareasMap.length,
        (i) => Tareas(
            id: tareasMap[i]['id'],
            title: tareasMap[i]['title'],
            isCompleted: tareasMap[i]['isCompleted'] == 1));
  }

  // CON SENTENCIAS
  // static Future<void> insertar2(Animal animal) async {
  //   Database database = await _openDB();
  //   var resultado =
  //       await database.rawInsert("INSERT INTO animales (id, nombre, especie)"
  //           " VALUES (${animal.id}, ${animal.nombre}, ${animal.especie})");
  // }
}
