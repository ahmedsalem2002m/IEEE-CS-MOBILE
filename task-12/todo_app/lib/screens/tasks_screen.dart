import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key, required this.tasks});

  final List<Map> tasks;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.88,
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child: ListView.separated(
              itemBuilder:
                  (context, index) => ListTile(
                    title: Row(
                      children: [
                        // Icon(Icons.check_box,color: Colors.white,),
                        Expanded(
                          child: Text(
                            "${tasks[index]["title"]}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.archive, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete, color: Colors.white),
                        ),
                      ],
                    ),
                    leading: Icon(Icons.check_box, color: Colors.white),
                    onTap: () {
                      print("Ontap");
                    },
                    subtitle: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${tasks[index]["time"]}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            "${tasks[index]["date"]}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // trailing: Text(
                    //     "12/2/2023"
                    // ),
                  ),
              separatorBuilder:
                  (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(color: Colors.black),
                  ),
              itemCount: tasks.length,
            ),
          ),
        ],
      ),
    );
  }
}
