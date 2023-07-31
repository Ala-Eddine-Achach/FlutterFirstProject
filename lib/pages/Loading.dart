import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
