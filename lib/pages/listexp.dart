import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:projecttest/expenses/list.dart';
import '../expenses/widget.dart';
import 'home.dart';

class expanses_page extends StatefulWidget {
  const expanses_page({super.key});

  @override
  State<expanses_page> createState() => _expanses_pageState();
}

class _expanses_pageState extends State<expanses_page> {
  get widget_list=>(exp_list.map((e)=>Expanses(item:e))).toList();
  @override
  Widget build(BuildContext context) {
    return ListView(
         children: widget_list,

        );


  }
}
