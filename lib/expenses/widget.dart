import 'dart:math';
import 'package:projecttest/showdialog/delete.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'list.dart';

class Expanses extends StatefulWidget {
  final Map<String, dynamic> item;
  final i;
  const Expanses({Key? key,required this.i, required this.item}) : super(key: key);

  @override
  State<Expanses> createState() => _ExpansesState();
}

class _ExpansesState extends State<Expanses> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: ()=>{setState(()=>{ delete_item(context,widget.i)})}

      ,
      child: Container(

          height: 96,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: (Theme.of(context).brightness == Brightness.dark
                  ? Colors.teal[50]
                  : Colors.white),
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.item["item"],
                        style: TextStyle(
                            fontSize: 18,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                    ? Colors.teal
                                    : Colors.blueGrey)),
                      ),
                      Text(
                        '\$' + "${widget.item["amount"]}",
                        style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    //IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever_rounded),alignment:Alignment.topRight ,),
                    Icon(
                      icons[widget.item["category"]],
                      size: 57,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      shadows: [
                        BoxShadow(
                          color: Colors.black.withAlpha(100),
                          blurRadius: 10.0,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      DateFormat('dd/MM/yyyy')
                          .format(DateTime.parse(widget.item["day"])),
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.lerp(Colors.black,
                            Theme.of(context).scaffoldBackgroundColor, 0.5),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class static_expenses extends StatefulWidget {
  int j;

  static_expenses({required this.j, super.key}) {
    this.j = j;
  }

  int get i => this.j;

  @override
  State<static_expenses> createState() => _static_expensesState();
}

class _static_expensesState extends State<static_expenses> {
  double getSumOfAmounts(List<Map<String, dynamic>> exp_list,
      {String cat = "all"}) {
    double sum_of_amounts = 0.0;
    for (Map<String, dynamic> exp in exp_list) {
      if ((cat == "all") ? true : exp["category"] == cat)
        sum_of_amounts += exp["amount"];
    }
    return sum_of_amounts;
  }
  late int i;
  get sum =>getSumOfAmounts(expList, cat: cats[i]);
  List a=[
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.cyan,
    Colors.indigo,
  ];late Color x;
  @override
  void initState() {
    super.initState();
    i = widget.i;
     x=a[Random().nextInt(a.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: EdgeInsets.symmetric(  horizontal: 10),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(overflow: TextOverflow.ellipsis,
                  cats[i],
                  style: TextStyle(
                      fontSize: (sum>(pourcent[widget.i] * salary))?30:20,
                      color:(sum>(pourcent[widget.i] * salary))?Colors.red: ((Theme.of(context).brightness == Brightness.dark
                          ? Colors.teal
                          : Colors.blueGrey))),

                ),
                Text(overflow: TextOverflow.ellipsis,
                  "\$${sum.toStringAsFixed(1)}/\n       \$${(pourcent[i] * salary).toStringAsFixed(1)}",
                  style: TextStyle(
                      fontSize: 14,
                      color: (sum>(pourcent[widget.i] * salary))?Colors.red:((Theme.of(context).brightness == Brightness.dark
                          ? Colors.teal
                          : Colors.blueGrey))),
                ),
              ],
            ),
            FittedBox(
              child: LinearPercentIndicator(
                percent: (sum>(pourcent[widget.i] * salary))?1:sum / (pourcent[widget.i] * salary),
                width: 300.0,
                lineHeight:(sum>(pourcent[widget.i] * salary))?15: 10,
                barRadius: Radius.circular(5.0),
                progressColor: (sum>(pourcent[widget.i] * salary))?Colors.red: x,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
