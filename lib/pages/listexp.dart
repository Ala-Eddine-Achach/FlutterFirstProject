import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projecttest/expenses/hive.dart';
import 'package:projecttest/expenses/list.dart';

import '../expenses/widget.dart';

class ExpansesPage extends StatefulWidget {
  const ExpansesPage({super.key});

  @override
  State<ExpansesPage> createState() => _ExpansesPageState();
}

class _ExpansesPageState extends State<ExpansesPage> {
  ScrollController controller = ScrollController();
  double topContainer = 0;
  @override
  void initState() {
    controller.addListener(() {



      setState(() {
        topContainer =(controller.offset/92) ;});});
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          controller:controller ,
          itemCount: expmap.length,
         physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            double scale = 1;

              scale = index +1 - topContainer;
              if (scale < 0) {
                scale = 0;
              } else if (scale > 1) {
                scale = 1;
              }
            final keylist=   expmap.keys.toList();
            keylist.sort();
            final int key = keylist.reversed.toList()[index]; // Get the key at the specified index
            final  e = expmap[key]!; // Get the expense using the key
            return Opacity(
              opacity: scale,
              child: Transform(
                  transform:  Matrix4.identity()..scale(scale,scale),
                  alignment: Alignment.bottomCenter,
                  child: Align(alignment:Alignment.topRight,heightFactor:0.8,child: Expanses(i:key,item: e))),
            );
          },
        ),
        Positioned(
          top: 5,
          right: 10,
          child: SpeedDial(direction: SpeedDialDirection.down,
            animatedIcon: AnimatedIcons.view_list,
            elevation: 60,
            buttonSize: Size(40,40),
            children: [
              SpeedDialChild(
                label:"date inc" ,
                child:Icon(Icons.safety_check_rounded) ,
              ),
              SpeedDialChild(
                label:"date dec" ,
                child: Icon(Icons.add_a_photo),
              ),
              SpeedDialChild(
                label: "amount inc",
                child: Icon(Icons.abc_outlined) ,
              ),
              SpeedDialChild(
                label: "amount dec",
                child: Icon(Icons.access_alarm_sharp),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
