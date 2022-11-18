import 'package:flutter/material.dart';
import 'package:midterm_practice/models/group.dart';

class GroupForm extends StatefulWidget {
  const GroupForm({Key? key}) : super(key: key);

  @override
  State<GroupForm> createState() => _GroupFormState();
}

class _GroupFormState extends State<GroupForm> {

  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  var selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Group Form")
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "E.g. Section GC",
                      labelText: "Group Name",
                    ),
                    validator: (value) {
                      return value == null || value.isEmpty ? "Enter Group Name" : null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: DropdownButtonFormField(
                    hint: Text("Group Type"),
                      items: [
                        DropdownMenuItem(
                            value: "Institution",
                            child: Text("Institution")),
                        DropdownMenuItem(
                            value: "Family",
                            child: Text("Family")),
                        DropdownMenuItem(
                            value: "Friends",
                            child: Text("Friends")),
                      ],
                      onChanged: (value) {
                        selectedType = value!;
                      }),
                ),
                SizedBox(height: 100),
                ElevatedButton(
                    onPressed: () async {
                    if(formKey.currentState!.validate()){
                      var newGroup = await Group(
                        groupName: nameController.text,
                        type: selectedType,
                      );

                      Navigator.pop(context, newGroup);
                    }

                    },
                    child: Text("Submit"))
              ],
            ),
          )
        )
      )
    );

  }
}
