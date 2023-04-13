import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled3/modules/archived_tasks/archived_tasks_screan.dart';
import 'package:untitled3/modules/done_tasks/done_tasks_screan.dart';
import 'package:untitled3/modules/new_tasks/new_tasks_screan.dart';
import 'package:untitled3/shared/components/components.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  int currentIndex = 0;

  List<Widget> screens =
  [
    NewTasksScrean(),
    DoneTasksScrean(),
    ArchivedTasksScrean(),
  ];

  List<String> titles =
  [
    "New Tasks",
    "Done Tasks",
    "Archived Tasks",
  ];

  late Database database;

  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();

  bool isBottomSheetShow = false;

  IconData fabIcon = Icons.edit;

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text(
          titles[currentIndex],
        ),
      ),
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: ()
         {
        //   // try
        //   // {
        //   //   var name = await getName();
        //   //   print(name);
        //   //   print('osha 22');
        //   //   throw('some errors'); // to create error
        //   //
        //   // }catch(error)
        //   // {
        //   //   print('error ${error.toString()}');
        //   // }
        //
        //   getName().then((value)  // بتشتغل نفس شغل try , catch
        //                           // الفرق بينهم انك تضمن ان العمليات تمشي بالترتيب
        //   {
        //     print(value);
        //     print('osha 22');
        //     throw('ana 3mlt error');
        //   }).catchError((error){
        //     print('error is ${error.toString()}');
        //   });
        //
           // insetToDatabase();

           if (isBottomSheetShow)
           {
             if(formkey.currentState!.validate())
               {
                 insertToDatabase(
                   title:titleController.text,
                   date:dateController.text,
                   time: timeController.text,
                 ).then((value)
                 {
                   Navigator.pop(context);
                   isBottomSheetShow = false;
                   setState(()
                   {
                     fabIcon = Icons.edit;
                   });
                 });
               }

           }
           else
           {
             scaffoldkey.currentState!.showBottomSheet(
             (context) => Container(
               color: Colors.grey[100],
               padding: EdgeInsets.all(20.0,),
               child: Form(
                 key: formkey,
                 child: Column(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     defaultFormfield(controller: titleController,
                         type: TextInputType.text,
                         validate: (String? value)
                         {
                           if(value!.isEmpty)
                             {
                               return 'title must not be empty';
                             }
                           return null;
                         },
                         lable: 'Task Title',
                         prefix: Icons.title,
                     ),
                     SizedBox(height: 15,),
                     defaultFormfield(controller: timeController,
                       type: TextInputType.datetime,
                       onTap: (){
                        showTimePicker(context: context,
                            initialTime: TimeOfDay.now()
                        ).then((value)
                        {
                          timeController.text =  value!.format(context).toString();
                         print(value!.format(context));
                        }
                        );
                       },
                       validate: (String? value)
                       {
                         if(value!.isEmpty)
                         {
                           return 'time must not be empty';
                         }
                         return null;
                       },
                       lable: 'Task time',
                       prefix: Icons.watch_later_outlined,
                     ),
                     SizedBox(height: 15,),
                     defaultFormfield(controller: dateController,
                       type: TextInputType.datetime,
                       onTap: (){
                       showDatePicker(context: context,
                           initialDate: DateTime.now(),
                           firstDate: DateTime.now(),
                           lastDate: DateTime.parse('2023-05-01')
                       ).then((value)
                       {
                         // print(DateFormat.yMMMd().format(value!));
                         dateController.text = DateFormat.yMMMd().format(value!);
                       });
                       },
                       validate: (String? value)
                       {
                         if(value!.isEmpty)
                         {
                           return 'date must not be empty';
                         }
                         return null;
                       },
                       lable: 'Task date',
                       prefix: Icons.calendar_today,
                     ),
                   ],
                 ),
               ),
             ),
             elevation: 20.0,
             ).closed.then((value) {
               isBottomSheetShow = false;
               setState(()
               {
                 fabIcon = Icons.edit;
               });
             });
             isBottomSheetShow = true;
             setState(()
             {
               fabIcon = Icons.add;
             });
           }


        },
        child: Icon(
          fabIcon,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // only fixed
        // elevation: 5.0,
        currentIndex: currentIndex, // the page u open
          onTap: (index)
          {
            setState(() {
              currentIndex = index;
            });
          },
          items:
          [
            BottomNavigationBarItem(icon:
            Icon(
              Icons.menu,
            ),
              label: "Tasks",
            ),
            BottomNavigationBarItem(icon:
            Icon(
              Icons.check_circle_outline,
            ),
              label: "Done",
            ),
            BottomNavigationBarItem(icon:
            Icon(
              Icons.archive_outlined,
            ),
              label: "Archived",
            ),
          ],
      ),
    );
  }

  Future<String> getName()  async
  {
    return "Ahmed ali";
  }

  void createDatabase() async
  {
      database =  await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database , version)
      {
        print('database created');
        database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)').then((value) {
          print('table created');
        }).catchError((error){
          print('erroe when creating table ${error.toString()}');
        }) ;
      },
      onOpen: (database)
      {
        print('database opened');
      }
    );
  }

  Future insertToDatabase(
  {
    required String title,
    required String time,
    required String date,
  }) async
  {
    return await database.transaction((txn) async
      {
        txn.rawInsert(
        'INSERT INTO tasks(title ,data, time ,status) VALUES ("$title","$time","$date","new")'
        ).then((value){
        print("$value inserted successfully");
        }).catchError((error)
        {
        print('erroe when inserting New Record ${error.toString()}');
        });


    });
  }

}
