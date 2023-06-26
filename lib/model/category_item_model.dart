import 'package:flutter/animation.dart';
import 'package:news_app_course_route/MyTheme.dart';

class CategoryShape {
  String id;
  String title;
  Color color;
  String imagePath;
  CategoryShape(
      {required this.id,
      required this.title,
      required this.color,
      required this.imagePath});

   static List<CategoryShape> getCategory() {
    return [
      CategoryShape(
          id: 'sports',
          title: 'Sports',
          color: MyThemeData.redColor,
          imagePath: 'assets/images/ball.png'),
      CategoryShape(
          id: 'politics',
          title: 'Politics',
          color: MyThemeData.darkBlueColor,
          imagePath: 'assets/images/Politics.png'),
      CategoryShape(
          id: 'health',
          title: 'Health',
          color: MyThemeData.pinkColor,
          imagePath: 'assets/images/health.png'),
      CategoryShape(
          id: 'business',
          title: 'Business',
          color: MyThemeData.brownColor,
          imagePath: 'assets/images/bussines.png'),
      CategoryShape(
          id: 'environment',
          title: 'Environment',
          color: MyThemeData.blueColor,
          imagePath: 'assets/images/environment.png'),
      CategoryShape(
          id: 'science',
          title: 'Science',
          color: MyThemeData.yellowColor,
          imagePath: 'assets/images/science.png'),
    ];
  }
}
