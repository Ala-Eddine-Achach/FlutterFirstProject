import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:projecttest/expenses/hive.dart';
import 'package:projecttest/expenses/list.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  @override
  void initState() {
    super.initState();
    navigateToHomePage();

  }

  Future<void> navigateToHomePage() async {
    print("c");
    var data = Hive.box("data");
    if (data.isEmpty) {
      print("d");
      for (var element in expList) {
        print("a");
        await addexp(
          element["category"],
          element["item"],
          element["amount"],
          DateTime.parse(element["day"]),
        );
      }
      data.put("firstTime", false);

    }else {
      var box =  Hive.box<Expense>("Expanses");
      expmap= box.toMap().map((key, value) =>  MapEntry(key, value.toMap()));
    }

    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, '/home');
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:

          Container(
            decoration: const BoxDecoration(

              gradient: LinearGradient(
                colors: [Colors.deepPurple,
                         Colors.pinkAccent,

                         Colors.greenAccent,
                          Colors.deepOrangeAccent,

                         ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight

              )
            ),
            child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.attach_money,size:200,color: Colors.blue,),




                SizedBox(height: 40,) ,
                SpinKitSpinningLines(
                  color: Colors.blue,
                  size: 400.0,
                  ),
              ],
            ),
        ),
          ),);

}}
