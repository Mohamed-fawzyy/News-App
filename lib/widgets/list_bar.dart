// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_news.dart';

import 'my_text.dart';

class ListBar extends StatelessWidget {
  final String text;
  ListBar({
    Key? key,
    required this.text,
  }) : super(key: key);
  String val = '';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const RotatedBox(
          quarterTurns: 1,
          child: Divider(
            thickness: 0.5,
            color: Colors.black,
            height: 0,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryNews(
                    text: text,
                  ),
                ));
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: MyText(
              text: text,
              size: 16,
              fontStyle: FontStyle.italic,
              textDecore: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
