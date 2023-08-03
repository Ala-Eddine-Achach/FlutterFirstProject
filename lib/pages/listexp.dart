import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hive/hive.dart';
import 'package:projecttest/expenses/hive.dart';

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
        topContainer = (controller.offset / 92);
      });
    });
    // TODO: implement initState
    super.initState();
  }

  var keylist = expmap.keys.toList();

  order(String s) async {
    var data = Hive.box("data");
    String c = await data.get("order");
    if (c != s) {
      await data.put("order", s);
    }
    ;
    setState(() {
      keylist.sort(compare);
    });
    setState(() {
      keylist = keylist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          controller: controller,
          itemCount: expmap.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            double scale = 1;

            scale = index + 1 - topContainer;
            if (scale < 0) {
              scale = 0;
            } else if (scale > 1) {
              scale = 1;
            }

            final int key =
                keylist.toList()[index]; // Get the key at the specified index
            final e = expmap[key]!; // Get the expense using the key
            return Opacity(
              opacity: scale,
              child: Transform(
                  transform: Matrix4.identity()..scale(scale, scale),
                  alignment: Alignment.bottomCenter,
                  child: Align(
                      alignment: Alignment.topRight,
                      heightFactor: 0.8,
                      child: Expanses(i: key, item: e))),
            );
          },
        ),
        Positioned(
          top: 5,
          right: 10,
          child: SpeedDial(

            direction: SpeedDialDirection.down,
            animatedIcon: AnimatedIcons.menu_home,
            elevation: 60,
            buttonSize: const Size(40, 40),
            children: [
              SpeedDialChild(
                label: "date inc",
                child: const Icon(Icons.timer_outlined),
                onTap: () {
                  order("date inc");
                },
              ),
              SpeedDialChild(
                label: "date dec",
                child: const Icon(Icons.timer_rounded),
                onTap: () {
                  order("date dec");
                },
              ),
              SpeedDialChild(
                label: "amount inc",
                child: const Icon(Icons.monetization_on),
                onTap: () {
                  order("amount inc");
                },
              ),
              SpeedDialChild(
                label: "amount dec",
                child: const Icon(Icons.monetization_on_outlined),
                onTap: () {
                  order("amount dec");
                },
              ),
            ],
          ),
        ),

      ],
    );
  }
}
