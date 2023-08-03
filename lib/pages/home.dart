import 'package:flutter/material.dart';
import 'package:projecttest/main.dart';
import 'package:projecttest/pages/profile.dart';
import 'package:projecttest/pages/statics.dart';
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
              trackColor: trackColor,

              thumbIcon:thumbIcon,
                value: themeManager.themeMode == ThemeMode.dark,
                onChanged: (newValue) {
                  setState(() {
                    themeManager.toggletheme(newValue);
                  });
                }),

          ],
          bottom: TabBar(
            indicatorWeight: 3,
            tabs: <Widget>[
              Tab(height: 65,
                icon: const Icon(Icons.list,size:20,),
                text: titles[0],
              ),
              Tab(height: 65,
                icon: const Icon(IconData(0xee51, fontFamily: 'MaterialIcons'),size:20),
                text: titles[1],
              ),
              Tab(height: 65,
                icon: const Icon(Icons.person,size:20),
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
            AddItem(context) ;
            });},

        ),

        ),
      );

  }

  final MaterialStateProperty<Icon?> thumbIcon =
  MaterialStateProperty.resolveWith<Icon?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.dark_mode,color: Colors.black,);
      }
      return const Icon(Icons.light_mode,color: Colors.pinkAccent,);
    },
  );

}
final MaterialStateProperty<Color?> trackColor =
MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
    // Track color when the switch is selected.
    if (states.contains(MaterialState.selected)) {
      return Colors.grey[850];
    }
    // Otherwise return null to set default track color
    // for remaining states such as when the switch is
    // hovered, focused, or disabled.
    return Colors.pinkAccent[100];
  },
);

