import 'package:flutter/material.dart';
import 'package:midterm_practice/models/group.dart';
import 'package:midterm_practice/models/student.dart';
import 'package:midterm_practice/tabs/tab1.dart';
import 'package:midterm_practice/tabs/tab2.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  late TabController tabController;

  List <Student> student_list = [
    Student(
        name: "Mark Gaje",
        section: "R1",
        age: 21
    )
  ];

  List <Group> group_list = [
    Group(
        groupName: "R5 GC",
        type: "Schooling"
    )
  ];

  @override
  void initState(){
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(icon: Icon(Icons.person)),
            Tab(icon: Icon(Icons.group))
          ],
        )
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Students(student_list: student_list),
          Groups(list: group_list),
        ],
      ),

    );
  }
}
