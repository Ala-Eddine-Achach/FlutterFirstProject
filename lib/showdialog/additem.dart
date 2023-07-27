import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../expenses/list.dart';




Future<void> AddItem(BuildContext context,Function additem) async {
  Map<String, dynamic> newItem = {
    "category": cats[0], // Default category is the first one in the list.
    "item": "",
    "amount": 0.0,
    "day": DateTime.now().toIso8601String(),
  };

  await showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 50,
        backgroundColor: Color.lerp(Colors.white,
            Theme.of(context).scaffoldBackgroundColor, 0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        title: const Text(
          "Add New Item",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButton<String>(
                  value: newItem["category"],
                  items: cats.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [Icon(icons[value]),
                          Text(value)
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    if (value != null) {
                      // seUpdate the selected category.
                      newItem['category'] = value;
                    }
                  },
                  underline: const SizedBox.shrink(),
                  isExpanded: true,
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(maxLength: 30,
                maxLines: 1,
                decoration: const InputDecoration(
                  labelText: 'Item',
                  border: OutlineInputBorder(),
                  fillColor: Colors.black,
                ),
                onChanged: (value) => newItem['item'] = value,
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                  fillColor: Colors.black,
                ),
                maxLength: 5,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  // Update the amount value.
                  newItem['amount'] = double.parse(value);
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Call the addItem function and pass the new item.
              additem(newItem);
              Navigator.of(context).pop();
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
}
