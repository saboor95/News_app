import 'package:flutter/material.dart';
import '../models/categoryData.dart';


class CategoryItem extends StatelessWidget {

  CategoryData categoryData;
  int index;
  CategoryItem(this.categoryData,this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryData.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomLeft: index.isEven?Radius.circular(25):Radius.zero,
          bottomRight: index.isOdd?Radius.circular(25):Radius.zero,
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(categoryData.image,height:110 ,),
          Expanded(child: Container(child: Center(
              child: Text(categoryData.title,style:TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ) ,),),),),
        ],
      ),
    );
  }
}
