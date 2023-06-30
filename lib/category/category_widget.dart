import 'package:flutter/material.dart';
import 'package:news_app_course_route/category/category_item.dart';
import 'package:news_app_course_route/model/category_item_model.dart';

class categoryShow extends StatelessWidget {
  var categoryList = Category.getCategory();
  Function onCategoryItemClick;
  categoryShow({required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Expanded(
        child: GridView.builder(itemCount: categoryList.length ,itemBuilder: ((context,index ) {
          return InkWell(
            onTap: (){
              onCategoryItemClick(categoryList[index]);
            },
              child: categoryItem(category: categoryList[index], index: index));
        }) ,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),),
      ),
    );
  }
}
