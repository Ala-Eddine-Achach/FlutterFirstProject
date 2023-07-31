import 'package:flutter/cupertino.dart';
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
    return ListView.builder(
      controller:controller ,
      itemCount: expList.length,
     physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        double scale = 1;

          scale = index +1 - topContainer;
          if (scale < 0) {
            scale = 0;
          } else if (scale > 1) {
            scale = 1;
          }

        final e = expList[index];
        return Opacity(
          opacity: scale,
          child: Transform(
              transform:  Matrix4.identity()..scale(scale,scale),
              alignment: Alignment.bottomCenter,
              child: Align(alignment:Alignment.topRight,heightFactor:0.8,child: Expanses(item: e))),
        );
      },
    );
  }
}
