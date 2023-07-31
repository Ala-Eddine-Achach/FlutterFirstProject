import 'package:flutter/material.dart';
import 'package:projecttest/main.dart';
import 'package:projecttest/pages/profile.dart';
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


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var widget_list;

  get widjet_list => (expList.map((e) => Expanses(item: e))).toList();

  void addItem(Map<String, dynamic> newItem) {
    // Add the new item to the list.
    setState(() => {expList.insert(0, newItem)});
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {Navigator.pushReplacementNamed(context, '/home');},
          ),
          title: const Center(child: Text("MASROUFEK")),
          actions: [IconButton(onPressed: (){Navigator.pushReplacementNamed(context, '/login');}, icon: Icon(Icons.login_rounded)) ,
            Switch(
                value: themeManager.themeMode == ThemeMode.dark,
                onChanged: (newValue) {
                  setState(() {
                    themeManager.toggletheme(newValue);
                  });
                }),

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
        body: const TabBarView(
          children: <Widget>[
            ExpansesPage(),
            ExpenseContainer(),
            Profile(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child:const Icon(Icons.plus_one),
          onPressed: () { setState(() {
            AddItem(context,addItem) ;
            });},

        ),

        ),
      );

  }
}
