import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {

  final text_title;
  final text_data;

  const CustomText({required this.text_title, required this.text_data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 100,
          child: Text(text_title),
          ),
          VerticalDivider(width: 50),
          Container(
            height: 20,
            width: 100,
            child: Text(": $text_data"),
          ),
        ],
      )
    );
  }
}
