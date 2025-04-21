import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/screens/archive_screen.dart';
import 'package:todo_app/screens/done_screen.dart';
import 'package:todo_app/screens/tasks_screen.dart';
import '../widgets/reusable_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _titleController = TextEditingController();
  var _timeController = TextEditingController();
  var _dateController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _controller = NotchBottomBarController(
    index: 0,
  );
  // List<Widget> get screens => [
  //   TasksScreen(tasks: tasks),
  //   ArchiveScreen(),
  //   DoneScreen(),
  // ];
  // bool isBottomSheetShow = false;
  // late Database database;
  // List<Map> tasks = [];
  //
  // @override
  // void initState() {
  //   super.initState();
  //   createDatabase();
  // }
  //
  // void createDatabase() async {
  //   database = await openDatabase(
  //     'path.db',
  //     version: 1,
  //     onCreate: (Database db, int version) async {
  //       await db.execute(
  //         'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT, time TEXT, date TEXT, status TEXT)',
  //       );
  //     },
  //   );
  //
  //   tasks = await getDataFromDatabase();
  //   setState(() {});
  // }
  //
  // Future<void> insertToDatabase({
  //   required String title,
  //   required String time,
  //   required String date,
  //   required String status,
  // }) async {
  //   await database.transaction((txn) async {
  //     await txn.rawInsert(
  //       'INSERT INTO Tasks(title, time, date, status) VALUES("$title", "$time", "$date", "$status")',
  //     );
  //   });
  //
  //   tasks = await getDataFromDatabase();
  //   setState(() {});
  // }
  //
  // Future<List<Map>> getDataFromDatabase() async {
  //   return await database.rawQuery('SELECT * FROM Tasks');
  // }


  @override
  void initState() {
    super.initState();
    createDatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green[100],
        title: Row(
          children: [
            Icon(
              Icons.playlist_add_check_outlined,
              size: 32,
              color: Colors.white,
            ),
            Text(
              "All Tasks",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(screens.length, (index) => screens[index]),
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        showLabel: true,
        elevation: 1,
        removeMargins: false,
        bottomBarWidth: 500,
        showShadow: false,
        durationInMilliSeconds: 300,
        notchColor: Colors.black,
        bottomBarItems: [
          bottomBarItem(icon: Icons.home, text: "Tasks"),
          bottomBarItem(icon: Icons.archive, text: "Archive"),
          bottomBarItem(icon: Icons.check_box, text: "Done"),
        ],
        notchBottomBarController: _controller,
        onTap: (int index) {
          _pageController.jumpToPage(index);
        },
        kIconSize: 24,
        color: Colors.grey,
        kBottomRadius: 24,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          if (isBottomSheetShow) {
            if (_formKey.currentState!.validate()) {
              insertToDatabase(
                title: _titleController.text,
                time: _timeController.text,
                date: _dateController.text,
                status: "status",
              ).then((value) {
                Navigator.pop(context);
                isBottomSheetShow = false;
              });
            }
          } else {
            _scaffoldKey.currentState!
                .showBottomSheet((context) {
                  return AddTaskScreen(
                    formKey: _formKey,
                    timeController: _timeController,
                    titleController: _titleController,
                    dateController: _dateController,
                  );
                })
                .closed
                .then((value) {
                  isBottomSheetShow = false;
                });
            isBottomSheetShow = true;
          }
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
