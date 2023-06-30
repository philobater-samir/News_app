import 'package:flutter/material.dart';
import 'package:news_app_course_route/MyTheme.dart';

class Category {
  String id;
  String title;
  Color color;
  String imagePath;
  Category(
      {required this.id,
      required this.title,
      required this.color,
      required this.imagePath});
  /// entertainment

   static List<Category> getCategory() {
    return [
      Category(
          id: 'sports',
          title: 'Sports',
          color: MyThemeData.redColor,
          imagePath: 'assets/images/ball.png'),
      Category(
          id: 'technology',
          title: 'Technology',
          color: MyThemeData.darkBlueColor,
          imagePath: 'assets/images/computer.png'),
      Category(
          id: 'health',
          title: 'Health',
          color: MyThemeData.pinkColor,
          imagePath: 'assets/images/health.png'),
      Category(
          id: 'business',
          title: 'Business',
          color: MyThemeData.brownColor,
          imagePath: 'assets/images/bussines.png'),
      Category(
          id: 'general',
          title: 'General',
          color: MyThemeData.blueColor,
          imagePath: 'assets/images/environment.png'),
      Category(
          id: 'science',
          title: 'Science',
          color: MyThemeData.yellowColor,
          imagePath: 'assets/images/science.png'),
      Category(
          id: 'entertainment',
          title: 'Entertainment',
          color: Colors.purple,
          imagePath: 'assets/images/enter.png'),
    ];
  }
}
