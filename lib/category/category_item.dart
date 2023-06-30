import 'package:flutter/material.dart';
import 'package:news_app_course_route/model/category_item_model.dart';

class categoryItem extends StatelessWidget {
  Category category ;
  int index ;
  categoryItem({required this.category,required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          bottomLeft:Radius.circular(index%2 == 0 ? 12:0) ,
          bottomRight:Radius.circular(index%2 != 0 ? 12:0) ,
          topLeft:Radius.circular(12) ,
          topRight:Radius.circular(12) ,
        )

      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset(category.imagePath,height: 100,),
            SizedBox(height: 12,),
            Text(category.title,style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.white
            ),)
          ],
        ),
      ),
    );
  }
}
