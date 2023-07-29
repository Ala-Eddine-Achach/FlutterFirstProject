import 'package:flutter/material.dart';

import '../expenses/list.dart';

Future<void> delete_item(BuildContext context,Function delete) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.redAccent[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      title: const Text("Deleting ..."),
      content: const Text("Are you sure ??!"),
      actions: [TextButton(
        style: TextButton.styleFrom(
          textStyle: Theme.of(context).textTheme.labelLarge,
        ),
        child: const Text('YES'),
        onPressed: () {
                 delete();

                 Navigator.pushReplacementNamed(context, '/home');
        },
      ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('NO'),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),],
    );}
  );}
