import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projecttest/pages/main.dart';
import 'package:projecttest/pages/statics.dart';

import '../expenses/list.dart';
import '../expenses/widget.dart';
import '../showdialog/additem.dart';
import 'listexp.dart';
List<String> titles = <String>[
  'Expenses',
  'statics',
  'about',
];

var widget_list=(exp_list.map((e)=>Expanses(item:e))).toList();
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  void addItem(Map<String, dynamic> newItem) {
    // Add the new item to the list.
    setState(()=>{exp_list.add(newItem)});
  }
  @override
  Widget build(BuildContext context) {

    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    const int tabsCount = 3;



    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {},
          ),
          title: const Center(child: Text("MASROUFEK")),
          actions: [
            Switch(
                value: themeManager.themeMode == ThemeMode.dark,
                onChanged: (newValue) {
                  themeManager.toggletheme(newValue);
                })
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: const Icon(Icons.list),
                text: titles[0],
              ),
              Tab(
                icon: const Icon(IconData(0xee51, fontFamily: 'MaterialIcons')),
                text: titles[1],
              ),
              Tab(
                icon: const Icon(Icons.person),
                text: titles[2],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[

             const expanses_page(),
            ExpenseContainer( ),
            Container(),


          ],
        ),
        floatingActionButton: FloatingActionButton(
          child:const Icon(Icons.plus_one),
          onPressed: () { setState(() {
            AddItem(context,addItem) ;
            print(exp_list[exp_list.length-1]);
          });},

        ),

        ),
      );

  }
}
