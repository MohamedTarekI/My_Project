import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test1/ArchivedTasks.dart';
import 'package:test1/DoneTask.dart';
import 'package:test1/NewTasks.dart';

class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  late Database database; // Use 'late' keyword for late initialization
  var scaffoldKey = GlobalKey<ScaffoldState>(); // Corrected typo in variable name
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  var titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    createDatabase(); // Call the createDatabase method
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          titles[currentIndex],
        ),
      ),
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          if(isBottomSheetShown)
          {
            Navigator.pop(context);
            isBottomSheetShown = false;
            setState(() {
              fabIcon = Icons.edit;
            });
          } else
          {
            scaffoldKey.currentState?.showBottomSheet(
                  (context) => Container(
                    padding: EdgeInsets.all(20.0,),
                    color: Colors.grey[200],
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                children:
                [
                    TextFormField(
                      controller: titleController,
                      keyboardType : TextInputType.text,
                      validator: (Stringvalue)
                      {
                        var value;
                        if(value.isEmpty)
                        {
                          return'title must not be empty';
                        }
                        return null;
                      },

                      decoration: const InputDecoration(
                      labelText: 'Label', // Label text for the input field
                      hintText: 'Hint', // Hint text to display when the field is empty
                      prefixIcon: Icon(Icons.dangerous),
                    )
                    )
                ],
              ),
                  ),
            );
            isBottomSheetShown = true;
            setState(() {
              fabIcon = Icons.add;
            });
          }
        },
        child: Icon(
          fabIcon,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0.0,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
            ),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_circle_outline,
            ),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.archive,
            ),
            label: 'Archived',
          ),
        ],
      ),
    );
  }

  Future<String> getName() async {
    return 'Ahmed Ali';
  }

  void createDatabase() async {
    database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (db, version) async {
        print('Database created');
        await db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT, date TEXT,time TEXT, status TEXT)',
        );
        print('Table created');
      },
      onOpen: (db) {
        print('Database opened');
      },
    );
  }

  void insertToDatabase() async {
    await database.transaction((txn) async {
      final value = await txn.rawInsert(
        'INSERT INTO tasks(title,date,time,status) VALUES("first task","0101","200","new")',
      );
      print('$value inserted successfully');
      return null;
    }).catchError((error) {
      print('Error when inserting new record: ${error.toString()}');
    });
  }
}