import 'package:flutter/material.dart';
import 'package:news_app_course_route/MyTheme.dart';
import 'package:news_app_course_route/api_manegar.dart';
import 'package:news_app_course_route/category/tabs_sources.dart';
import 'package:news_app_course_route/model/category_item_model.dart';
import 'package:news_app_course_route/model/source_response.dart';

class categoryDetails extends StatelessWidget {
  static const String routeName = 'categoryDetails';
  Category? category;
  categoryDetails({this.category});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width ;
    return FutureBuilder<SourceResponse>(
        future:ApiManager.getSources(category?.id??'') ,
        builder: ((context,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: MyThemeData.primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: height * .1,
                  width: width * .5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:Column(
                    children: [
                      Text('Something Went wrong!',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                      ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                        primary: MyThemeData.primaryColor, // Background color
                      ), child: Text('Reload',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 12),))

                    ],
                  ) ,
                ),
              ),
            );
          }
          if(snapshot.data?.status!='ok'){
            return Center(
              child: Container(
                height:height*.1 ,
                width: width*.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child:Column(
                  children: [
                    Text(snapshot.data?.message?? '',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                    ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                      primary: MyThemeData.primaryColor, // Background color
                    ), child: Text('Reload',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 12),))

                  ],
                ) ,
              ),
            );
          }
          var sourceList = snapshot.data?.sources ??[];
          return tabsSources(source:sourceList);
        })
        );
  }
}
