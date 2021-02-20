import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:todoey/models/task.dart';

class DatabaseProvider {
  static final String tableName = 'TTASKS';

  // init database
  final Future<Database> database = openDatabase(
    join(getDatabasesPath().toString(), 'todoey_tasks.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE $tableName(ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, isdone BOOL)');
    },
    version: 1,
  );

  // insert new item
  Future<int> insertTask(Task task) async {
    final Database db = await database;
    return await db.insert(tableName, task.toMap(withid: false),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // get number of all rows
  Future<int> queryRowCount() async {
    Database db = await database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }

  // read full query of database
  Future<List<Task>> readDatabase() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    List<Task> list = List.generate(maps.length, (i) {
      Task task = Task(
        id: maps[i]['id'],
        name: maps[i]['name'],
      );
      task.isDone = (maps[i]['isdone'] == 0) ? false : true;
      return task;
    });
    list.sort((a, b) => a.id.compareTo(b.id));
    return list;
  }

  // update item in database
  Future<void> updateTask(Task task) async {
    final db = await database;

    await db.update(
      tableName,
      task.toMap(),
      where: "id = ?",
      whereArgs: [task.id],
    );
  }

  // delete item from database
  Future<void> deleteTask(int id) async {
    final db = await database;

    await db.delete(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> clearDatabase() async {
    final db = await database;
    await db.delete(tableName);
  }
}
