import 'package:flutter/material.dart';
import 'package:projecttest/expenses/widget.dart';
import 'package:projecttest/pages/home.dart';
import 'package:projecttest/temes_/theme_manager.dart';
import 'package:projecttest/temes_/themesdata.dart';
import 'expenses/hive.dart';
import 'pages/Loading.dart';
import 'pages/login.dart';

import 'package:hive_flutter/hive_flutter.dart';
Future<void> main()  async {
  await Hive.initFlutter();
  Hive.registerAdapter<Expense>(ExpenseAdapter());
  var data =await Hive.openBox("data");
  var box = await Hive.openBox<Expense>("Expanses");
runApp(MyApp());}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
ThemeManager themeManager=ThemeManager();
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    themeManager.addListener(themelistener);
    super.initState();
  }
  themelistener(){
   if(mounted){setState(() {

   });
  }}
  @override
  void dispose() {
    // TODO: implement dispose
    themeManager.removeListener(themelistener);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        theme:  lightmode,

        darkTheme: darkmode,

        themeMode: themeManager.themeMode,
        routes: {
          '/': (context) => const Loading(),
          '/home': (context) => const Home(),
          '/location': (context) => const Loading(),
          '/login': (context) => const Login(),
        });
  }
}



