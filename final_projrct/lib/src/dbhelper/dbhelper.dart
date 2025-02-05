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
    String path=join(document.path,'DbQuiz.db');
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


   Future<int> create(MainModel model) async
  {
    Database db=await instance.database;
    final data={
      'question':model.question,
      'option1':model.option1,
      'option2':model.option2,
      'option3':model.option3,
      'option4':model.option4,
    };

    var check= await db.insert('questions', data);
    if(check== null)
      {
        print('Data Did not Insert');
        return 0;
      }
    else
      {
        print('Data  Insert successfully');
        return 1;
      }

  }


 Future<List<Map<String,dynamic>>> read()async
  {
    Database db=await instance.database;
   List<Map<String,dynamic>> result = await db.query('questions');
   return result;
  }

}