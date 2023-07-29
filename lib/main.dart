import 'package:flutter/material.dart';
import 'package:projecttest/pages/home.dart';
import 'package:projecttest/temes_/theme_manager.dart';
import 'package:projecttest/temes_/themesdata.dart';

import 'pages/Loading.dart';
import 'pages/login.dart';

void main() => runApp(MyApp());
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
          '/': (context) => const loading(),
          '/home': (context) => const Home(),
          '/location': (context) => const loading(),
          '/login': (context) => const login(),
        });
  }
}



