import 'package:flutter/material.dart';
import 'package:news_app_course_route/MyTheme.dart';
import 'package:news_app_course_route/category/category_widget.dart';
import 'home_drawer.dart';

class home extends StatelessWidget {
static const String routeName = 'home' ;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyThemeData.whiteColor,
            child: Image.asset('assets/images/main_background.png',fit: BoxFit.fill,height: double.infinity,width: double.infinity,)),
        Scaffold(
          backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: MyThemeData.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(35),
                      bottomLeft:  Radius.circular(35)
                  )

              ),
              elevation: 0,
              centerTitle: true,
              title: Text('News',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            drawer: HomeDrawer(),
          body: categoryShow(),

        )
      ],
    );
  }
}
