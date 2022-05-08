import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/model/task.dart';

class DBHelper {
  Database ?database;
 void initDB() async{
    database = await openDatabase('tasks.db', version: 1,onCreate: (database,version){
     print('database created');
     database.execute(' CREATE TABLE tasks (id INTEGER  PRIMARY KEY, title TEXT, note TEXT,startTime TEXT, endTime TEXT, isCompleted INTEGER, date TEXT, remind TEXT, colorB INTEGER, colorG INTEGER, colorR INTEGER)').then((value) {
       print('table created');
     }).catchError((error){
       print('error is : $error');
     });
   },
   onOpen: (database){
     print('database is opened');
   }
   );
 }

Future<int> insert(Task  task)async{
 
 int ?index = await  database!.rawInsert('INSERT INTO tasks(title, note, startTime,endTime,isCompleted,date,remind,colorB,colorG,colorR) VALUES("${task.title}", ${task.note}, ${task.note},${task.startTime},${task.startTime},${task.endTime},${task.isCompleted},${task.date},${task.colorB},${task.colorG},${task.colorR})') ;
  
  if(index == null){
    return 0;
  }
  return index;
}

Future<int> delete(id)async{
  return await database!.rawDelete('DELETE FROM Test WHERE name = ?');
}

}