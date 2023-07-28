import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      color: (Theme.of(context).brightness == Brightness.dark
      ? Colors.teal[50]
          : Colors.white),
      boxShadow: [
      BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
      ]),
      child:Column(

        children: [

        ],
      )),
    );
  }
}
