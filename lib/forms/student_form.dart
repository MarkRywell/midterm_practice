import 'package:flutter/material.dart';
import 'package:midterm_practice/models/student.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({Key? key}) : super(key: key);

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {

  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  var selectedSection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Student Form")
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "E.g. Mark Gaje",
                      labelText: "Name"
                    ),
                    validator: (value) {
                      return value == null || value.isEmpty ? "Enter Name" : null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey
                      ),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButtonFormField(
                          hint: const Text("Section"),
                          items: const [
                            DropdownMenuItem(
                              value: "R1",
                              child: Text("R1"),
                            ),
                            DropdownMenuItem(
                              value: "R2",
                              child: Text("R2"),
                            ),
                            DropdownMenuItem(
                              value: "R3",
                              child: Text("R3"),
                            ),
                            DropdownMenuItem(
                              value: "R4",
                              child: Text("R4"),
                            ),
                            DropdownMenuItem(
                              value: "R5",
                              child: Text("R5"),
                            ),
                          ],
                          onChanged: (value){
                            selectedSection = value!;
                          }),
                    )
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: ageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "E.g. 20",
                      labelText: "Age"
                    ),
                    validator: (value) {
                      return value == null || value.isEmpty ? "Enter Age" : null;
                    },
                  ),
                ),
                SizedBox(height: 100),
                Container(
                  width: 80,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () async {

                        print(nameController.text);
                        print(int.parse(ageController.text));
                        print(selectedSection);

                        if(formKey.currentState!.validate()){
                          var newStudent = await (
                              Student(
                            name: nameController.text,
                            section: selectedSection,
                            age: int.parse(ageController.text)
                              )
                          );
                          Navigator.pop(context, newStudent);
                        }
                      },
                      child: Text("Submit")
                  ),
                )
              ],
            )
          )
        )
      )
    );
  }
}
