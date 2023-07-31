import 'package:flutter/cupertino.dart';
import 'package:projecttest/expenses/list.dart';

import '../expenses/widget.dart';

class Expanses_Page extends StatefulWidget {
  const Expanses_Page({super.key});

  @override
  State<Expanses_Page> createState() => _Expanses_PageState();
}

class _Expanses_PageState extends State<Expanses_Page> {
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
      itemCount: exp_list.length,
     physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        double scale = 1;

          scale = index +1 - topContainer;
          if (scale < 0) {
            scale = 0;
          } else if (scale > 1) {
            scale = 1;
          }

        final e = exp_list[index];
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
