import 'package:flutter/material.dart';
import 'package:news_app_course_route/home/Home.dart';
import 'package:news_app_course_route/settings/settings_tab.dart';

void main ()
{
  runApp(MyappNews());
}

class MyappNews extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        home.routeName : (context)=> home(),
        settingsTab.routeName : (context)=> settingsTab(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: home.routeName,


    );
  }
}
