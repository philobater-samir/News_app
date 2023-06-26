import 'package:flutter/material.dart';
import 'package:news_app_course_route/category/category_item.dart';
import 'package:news_app_course_route/model/category_item_model.dart';

class categoryShow extends StatelessWidget {
  var categoryList = CategoryShape.getCategory();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
            children: [
              GridView.builder(itemCount: 6 ,itemBuilder: ((context,index ) {
                return categoryItem(category: categoryList[index], index: index);
              }) ,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),)
            ],
          ),
    );
  }
}
