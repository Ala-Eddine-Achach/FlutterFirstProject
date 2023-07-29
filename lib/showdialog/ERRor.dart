import 'package:flutter/material.dart';

Future<void> error(
  BuildContext context,
) async {
  await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Icon(Icons.dangerous_outlined,color: Colors.purpleAccent,size:60,),
          elevation: 30,
          backgroundColor: Color.lerp(
              Colors.red, Theme.of(context).scaffoldBackgroundColor, 0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          title: const Text(
            "ERROR",
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
          content: Text(
              "Invalid input!! Please verify your item contenant and the amount"),
        );
      });
}
