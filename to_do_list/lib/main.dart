import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/data.dart';

const taskBoxName = "tasks";

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(PrioretyAdapter());
  await Hive.openBox<Task>(taskBoxName);
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: primeryColor));
  runApp(const MyApp());
}

const Color primeryColor = Color(0xff2a5e5b);
const Color prinetyVarintColor = Color.fromARGB(255, 3, 26, 24);
const sedndryTextColor = Color(0xff334a48);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primaryTextColor = Color(0xff0b1716);

    var themeData = ThemeData(
      // This is the theme of your application.
      //
      // TRY THIS: Try running your application with "flutter run". You'll see
      // the application has a purple toolbar. Then, without quitting the app,
      // try changing the seedColor in the colorScheme below to Colors.green
      // and then invoke "hot reload" (save your changes or press the "hot
      // reload" button in a Flutter-supported IDE, or press "r" if you used
      // the command line to start the app).
      //
      // Notice that the counter didn't reset back to zero; the application
      // state is not lost during the reload. To reset the state, use hot
      // restart instead.
      //
      // This works for code too, not just values: Most code changes can be
      // tested with just a hot reload.
      textTheme: GoogleFonts.poppinsTextTheme(),
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Color.fromARGB(255, 106, 130, 122)),
          border: InputBorder.none,
          iconColor: Color.fromARGB(255, 214, 238, 230)),
      colorScheme: ColorScheme.light(
          primary: primeryColor,
          onPrimaryFixedVariant: prinetyVarintColor,
          onPrimary: Colors.white,
          background: Color.fromARGB(255, 241, 255, 250),
          onSurface: primaryTextColor,
          onBackground: primaryTextColor,
          secondary: primeryColor,
          onSecondary: Color.fromARGB(249, 34, 4, 4)),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      home: const HomeScrren(),
    );
  }
}

class HomeScrren extends StatelessWidget {
  const HomeScrren({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Task>(taskBoxName);
    final themedata = Theme.of(context);
    var cupertinoIcons = CupertinoIcons;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EditTaskScrren()));
          },
          label: Text('Add New Task')),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 102,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                themedata.colorScheme.primary,
                themedata.colorScheme.onPrimaryFixedVariant
              ])),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "To Do List",
                          style: themedata.textTheme.bodyLarge!
                              .apply(color: themedata.colorScheme.onPrimary),
                        ),
                        Icon(
                          CupertinoIcons.bolt_horizontal_circle,
                          color: themedata.colorScheme.onPrimary,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: themedata.colorScheme.onPrimary,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20)
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(CupertinoIcons.search_circle),
                            label: Text(
                              'Search task ...',
                              style: themedata.textTheme.bodyMedium,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<Box<Task>>(
                valueListenable: box.listenable(),
                builder: (context, box, child) {
                  return ListView.builder(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 100),
                      itemCount: box.values.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Today",
                                      style: themedata.textTheme.bodyMedium!
                                          .apply(fontSizeFactor: 0.9),
                                    ),
                                    Container(
                                      height: 2,
                                      width: 48,
                                      margin: EdgeInsets.only(top: 3),
                                      decoration: BoxDecoration(
                                        color: primeryColor,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              MaterialButton(
                                color: Color.fromARGB(255, 219, 238, 238),
                                textColor: sedndryTextColor,
                                elevation: 0,
                                onPressed: () {},
                                child: Row(
                                  children: const [
                                    Text(
                                      "Delete All",
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Icon(
                                      CupertinoIcons.delete_simple,
                                      size: 16,
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        } else {
                          final Task task = box.values.toList()[index - 1];
                          return taskItem(task: task);
                        }
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class taskItem extends StatelessWidget {
  const taskItem({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        task.name,
        style: TextStyle(fontSize: 35),
      ),
    );
  }
}

class EditTaskScrren extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit task'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            final task = Task();
            task.name = _controller.text;
            task.priorety = Priorety.low;
            if (task.isInBox) {
              task.save();
            } else {
              final Box<Task> box = Hive.box(taskBoxName);
              box.add(task);
            }
            Navigator.of(context).pop();
          },
          label: Text('Save changes')),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration:
                InputDecoration(label: Text('Add a task for today ... ')),
          )
        ],
      ),
    );
  }
}
