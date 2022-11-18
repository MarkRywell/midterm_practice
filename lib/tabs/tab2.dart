import 'package:flutter/material.dart';
import 'package:midterm_practice/forms/group_form.dart';
import 'package:midterm_practice/models/group.dart';

class Groups extends StatefulWidget {

  final list;

  const Groups({required this.list, Key? key}) : super(key: key);

  @override
  State<Groups> createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.list.length,
          itemBuilder: (context, index){
          final group = widget.list[index];

            return Dismissible(
                key: UniqueKey(),
                child: ListTile(
                  title: Text(group.groupName),
                  subtitle: Text(group.type),
                )
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var newGroup = await Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => GroupForm()
                ));
            setState(() {
              widget.list.add(newGroup);
            });
          },
          child: Icon(Icons.group_add)
      ),
    );
  }
}
