import 'package:flutter/material.dart';
import 'package:midterm_practice/custom_widgets/custom_text.dart';

class DetailsPage extends StatelessWidget {
  final student;

  const DetailsPage({required this.student, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
         children: [
           CustomText(text_title: "Name", text_data: student.name),
           CustomText(text_title: "Section", text_data: student.section),
           CustomText(text_title: "Age", text_data: (student.age).toString()),
         ],
        ),
      )
    );
  }
}
