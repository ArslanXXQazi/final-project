import 'dart:core';
import 'dart:io';
import 'package:final_projrct/src/model/main_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbClass {
  DbClass._privateConstructor();
  static final instance = DbClass._privateConstructor();
  Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database!;
  }
  _initDatabase() async {
    Directory document=await getApplicationDocumentsDirectory();
    String path=join(document.path,'DbQuiz');
    return await  openDatabase(path,version: 1,onCreate: _onCreate);

  }

  _onCreate(Database db,int version)
  {
    db.execute(
      '''
      create table questions(
      id integer primary key,
      question TEXT,
        option1 TEXT,
        option2 TEXT,
        option3 TEXT,
        option4 TEXT
      )
      '''
    );
  }


  create(MainModel model) async
  {
    
  }


}