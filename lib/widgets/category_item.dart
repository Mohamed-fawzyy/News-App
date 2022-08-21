// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:news_app/widgets/list_bar.dart';

import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  Category category = Category();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: ListView.builder(
            itemCount: category.catList.length,
            itemBuilder: (context, i) => ListBar(text: category.catList[i]),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
