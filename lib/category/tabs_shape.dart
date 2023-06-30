import 'package:flutter/material.dart';
import 'package:news_app_course_route/MyTheme.dart';
import 'package:news_app_course_route/model/source_response.dart';

class TabShape extends StatelessWidget {
  Sources? sources ;
  bool isSelected ;
  TabShape({required this.sources,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? MyThemeData.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: MyThemeData.primaryColor)
        ),
        child: Text(
          sources?.name?? "",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: isSelected ? MyThemeData.whiteColor: MyThemeData.primaryColor
          ),
        ),
      ),
    );
  }
}
