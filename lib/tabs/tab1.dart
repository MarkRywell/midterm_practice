import 'package:flutter/material.dart';
import 'package:midterm_practice/details_page.dart';
import 'package:midterm_practice/forms/student_form.dart';
import 'package:midterm_practice/models/student.dart';

class Students extends StatefulWidget {
  final student_list;

  const Students({required this.student_list, Key? key}) : super(key: key);

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {

  var newStudent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: widget.student_list.length,
        itemBuilder: (context, index){
          final student = widget.student_list[index];

          return Dismissible(
              key: UniqueKey(),
              child: ListTile(
                title: Text(student.name),
                subtitle: Text(student.section),
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(student: student)
                  )
                  );
                },
              ),
              onDismissed: (direction) {
                setState(() {
                    widget.student_list.remove(student);
                });
          },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            newStudent = await Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => StudentForm()
            ));
            if (newStudent == null){
              return null;
            }
            else {
              setState(() {
              widget.student_list.add(newStudent);
            });
            }
          },
          child: Icon(Icons.person_add_alt_1)
      ),
    );
  }
}
