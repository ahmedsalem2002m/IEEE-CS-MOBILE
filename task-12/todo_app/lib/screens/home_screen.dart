import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  List<Widget> screens = [TasksScreen(), ArchiveScreen(), DoneScreen()];
  bool isBottomSheetShow = false;

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
        onPressed: () {
          if (isBottomSheetShow) {
            if (_formKey.currentState!.validate()) {
              Navigator.pop(context);
              isBottomSheetShow = false;
            }
          } else {
            _scaffoldKey.currentState!
                .showBottomSheet((context) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // TextFormField(
                          //   controller: _titleController,
                          //   validator: (value){
                          //     if(value!.isEmpty){
                          //       return "Please enter your task name";
                          //     }
                          //     return null;
                          //   },
                          //   decoration: InputDecoration(
                          //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          //     labelText: "Task Name",
                          //     prefixIcon: Icon(Icons.title)
                          //   ),
                          // ),
                          defaultTextFormField(
                            labelText: "Task Name",
                            controller: _titleController,
                            icon: Icons.title,
                            onTap: () {},
                            text: "enter your task name",
                          ),
                          SizedBox(height: 16),
                          defaultTextFormField(
                            labelText: "Task Time",
                            controller: _timeController,
                            icon: Icons.timer_rounded,
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                _timeController.text = value!.format(context);
                              });
                            },
                            text: "enter your task time",
                          ),
                          SizedBox(height: 16),
                          defaultTextFormField(
                            labelText: "Task Date",
                            controller: _dateController,
                            icon: Icons.date_range_outlined,
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse("3025-04-03"),
                              ).then((value){
                                _dateController.text = DateFormat.yMMMd().format(value!);
                              });
                            },
                            text: "enter your task date ",
                          ),
                        ],
                      ),
                    ),
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
