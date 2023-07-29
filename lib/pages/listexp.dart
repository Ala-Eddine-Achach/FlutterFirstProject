import 'package:flutter/cupertino.dart';
import 'package:projecttest/expenses/list.dart';

import '../expenses/widget.dart';

class Expanses_Page extends StatefulWidget {
  const Expanses_Page({super.key});

  @override
  State<Expanses_Page> createState() => _Expanses_PageState();
}

class _Expanses_PageState extends State<Expanses_Page> {
  get widget_list => (exp_list.map((e) => Expanses(item: e))).toList();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget_list,
    );
  }
}
