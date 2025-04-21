import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/cubit/states.dart';

import '../screens/archive_screen.dart';
import '../screens/done_screen.dart';
import '../screens/tasks_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [TasksScreen(), ArchiveScreen(), DoneScreen()];

  //bool isBottomSheetShow = false;
  late Database database;
  List<Map> tasks = [];

  void createDatabase() async {
    database = await openDatabase(
      'path.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT, time TEXT, date TEXT, status TEXT)');
      },
      onOpen: (database)async{
        await getDataFromDatabase(database).then((value){
          tasks = value;
        });
      }
    );
  }

  Future<void> insertToDatabase({
    required String title,
    required String time,
    required String date,
    required String status,
  }) async {
    await database.transaction((txn) {
      return txn
          .rawInsert(
            'INSERT INTO Tasks(title, time, date, status) VALUES("$title", "$time", "$date", "$status")',
          )
          .then((value) {
            getDataFromDatabase(database).then((value) {
                tasks = value;
            });
            emit(AppInsertDatabaseSuccessState());
          }).catchError((error){
            emit(AppInsertDatabaseErrorState(error.toString()));
      });
    });
  }

  Future<List<Map>> getDataFromDatabase(database) async {
    return await database.rawQuery('SELECT * FROM Tasks');
  }
}
