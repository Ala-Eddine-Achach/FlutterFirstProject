
import 'package:hive_flutter/hive_flutter.dart';

Map<dynamic, Map<String, dynamic>> expmap = {};

class ExpenseAdapter extends TypeAdapter<Expense> {
  @override
  int get typeId => 0; // An ID unique to this type.

  @override
  Expense read(BinaryReader reader) {
    final category = reader.readString();
    final item = reader.readString();
    final amount = reader.readDouble();
    final day = DateTime.parse(reader.readString());
    return Expense(category: category, item: item, amount: amount, day: day);
  }

  @override
  void write(BinaryWriter writer, Expense obj) {
    writer.writeString(obj.category);
    writer.writeString(obj.item);
    writer.writeDouble(obj.amount);
    writer.writeString(obj.day.toIso8601String());
  }

}

class Expense {
  String category;
  String item;
  double amount;
  DateTime day;

  Expense(
      {required this.category,
      required this.item,
      required this.amount,
      required this.day});
  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'item': item,
      'amount': amount,
      'day': day.toIso8601String(),
    };
  }
}

Future<void> addexp(
    String category, String item, double amount, DateTime day) async {
  Expense exp =
      Expense(category: category, item: item, amount: amount, day: day);
  var box =  Hive.box<Expense>("Expanses");
  var key = await box.add(exp);
  expmap[key] = {
    'category': category,
    'item': item,
    'amount': amount,
    'day': day.toIso8601String(),
  };

}

Future<void> delexp(key) async {
  var box =  Hive.box<Expense>("Expanses");
  await box.delete(key);
  expmap.remove(key);

}
int compare( a, b) {
  var data = Hive.box("data");
  String s = data.get("order");
  if (s == "date inc") {
    return DateTime.parse(expmap[b]?['day'])
        .compareTo(DateTime.parse(expmap[a]?['day']));
  } else if (s == "date dec") {
    return DateTime.parse(expmap[a]?['day'])
        .compareTo(DateTime.parse(expmap[b]?['day']));
  } else if (s == "amount inc") {
    var x = expmap[a]?['amount'] - expmap[b]?['amount'];
    return (x < 0.01)
        ? 0
        : (x > 0)
            ? 1
            : -1;
  } else {
    var x = expmap[b]?['amount'] - expmap[a]?['amount'];
    return (x < 0.01)
        ? 0
        : (x > 0)
        ? 1
        : -1;
  }
}
