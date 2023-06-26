import 'package:flutter/material.dart';
import 'package:news_app_course_route/MyTheme.dart';
import 'package:news_app_course_route/settings/settings_tab.dart';

class HomeDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Image.asset('assets/images/main_background.png',fit: BoxFit.fill,height: double.infinity,width: double.infinity,),
        Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              width: double.infinity,
              color: MyThemeData.primaryColor,
              child: Center(child: Text('News App !',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.center,)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: (){
                },
                child: Row(children: [
                  Icon(Icons.list,color: Colors.black,size: 40,),
                  SizedBox(width: 10,),
                  Text('Categories ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:20),)
                ],),
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(settingsTab.routeName);
                },
                child: Row(children: [Icon(Icons.settings,color: Colors.black,size: 40,),
                  SizedBox(width: 10,),
                  Text('Settings ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:20),)],),
              ),
            )
          ],
        ),
      ]
    );
  }
}
