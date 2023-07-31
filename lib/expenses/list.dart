import 'dart:core';

import 'package:flutter/material.dart';

double salary = 5000.0;

List<Map<String, dynamic>> expList = [
  {
    "category": "transportation",
    "item": "changing the wheel",
    "amount": 50.4,
    "day": "2023-07-15T00:00:00Z"
  },
  {
    "category": "other",
    "item": "daughter's birthday gift",
    "amount": 20.4,
    "day": "2023-07-15T00:00:00Z"
  },
  {
    "category": "food",
    "item": "groceries",
    "amount": 72.3,
    "day": "2023-07-16T00:00:00Z"
  },
  {
    "category": "entertainment",
    "item": "movie",
    "amount": 25.5,
    "day": "2023-07-17T00:00:00Z"
  },
  {
    "category": "transportation",
    "item": "bus",
    "amount": 10.2,
    "day": "2023-07-18T00:00:00Z"
  },
  {
    "category": "shopping",
    "item": "clothes",
    "amount": 45.6,
    "day": "2023-07-19T00:00:00Z"
  },
  {
    "category": "other",
    "item": "fix the tv",
    "amount": 100.4,
    "day": "2023-07-15T00:00:00Z"
  },
  {
    "category": "bills",
    "item": "electricity",
    "amount": 50.0,
    "day": "2023-07-20T00:00:00Z"
  },
  {
    "category": "food",
    "item": "restaurant",
    "amount": 65.4,
    "day": "2023-07-21T00:00:00Z"
  },
  {
    "category": "entertainment",
    "item": "movie",
    "amount": 30.5,
    "day": "2023-07-22T00:00:00Z"
  },
  {
    "category": "transportation",
    "item": "bus",
    "amount": 15.2,
    "day": "2023-07-23T00:00:00Z"
  },
  {
    "category": "shopping",
    "item": "groceries",
    "amount": 80.3,
    "day": "2023-07-24T00:00:00Z"
  },
  {
    "category": "entertainment",
    "item": "concert",
    "amount": 120.0,
    "day": "2023-07-30T00:00:00Z"
  },
  {
    "category": "bills",
    "item": "phone bill",
    "amount": 60.0,
    "day": "2023-07-31T00:00:00Z"
  },
  {
    "category": "food",
    "item": "coffee",
    "amount": 5.0,
    "day": "2023-08-01T00:00:00Z"
  },
  {
    "category": "transportation",
    "item": "train",
    "amount": 20.0,
    "day": "2023-08-02T00:00:00Z"
  },
  {
    "category": "shopping",
    "item": "books",
    "amount": 35.0,
    "day": "2023-08-03T00:00:00Z"
  },
  {
    "category": "bills",
    "item": "water bill",
    "amount": 30.0,
    "day": "2023-08-04T00:00:00Z"
  },
  {
    "category": "food",
    "item": "groceries",
    "amount": 70.0,
    "day": "2023-08-05T00:00:00Z"
  },
  {
    "category": "entertainment",
    "item": "museum",
    "amount": 25.0,
    "day": "2023-08-06T00:00:00Z"
  },
  {
    "category": "transportation",
    "item": "uber",
    "amount": 15.0,
    "day": "2023-08-07T00:00:00Z"
  },
  {
    "category": "shopping",
    "item": "clothes",
    "amount": 40.0,
    "day": "2023-08-08T00:00:00Z"
  },
  {
    "category": "bills",
    "item": "internet bill",
    "amount": 50.0,
    "day": "2023-08-09T00:00:00Z"
  },
  {
    "category": "food",
    "item": "restaurant",
    "amount": 60.0,
    "day": "2023-08-10T00:00:00Z"
  },
  {
    "category": "entertainment",
    "item": "concert",
    "amount": 100.0,
    "day": "2023-08-11T00:00:00Z"
  },
  {
    "category": "bills",
    "item": "rent",
    "amount": 1000.0,
    "day": "2023-08-12T00:00:00Z"
  },
  {
    "category": "food",
    "item": "groceries",
    "amount": 80.0,
    "day": "2023-08-13T00:00:00Z"
  },
  {
    "category": "transportation",
    "item": "bus",
    "amount": 10.0,
    "day": "2023-08-14T00:00:00Z"
  }
];
Map<String, IconData> icons = {
  "food": Icons.fastfood,
  "entertainment": Icons.movie,
  "transportation": Icons.car_repair,
  "shopping": Icons.shopping_cart,
  "bills": Icons.attach_money,
  "other": Icons.card_giftcard,
};
List<String> cats = [
  "food",
  "entertainment",
  "transportation",
  "shopping",
  "bills",
  "other"
];
List<double> pourcent = [0.14, 0.08, 0.14, 0.12, 0.28, 0.16];


