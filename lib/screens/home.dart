// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/widgets/my_text.dart';
import 'package:news_app/widgets/news.dart';

import '../tools/api.dart';
import '../widgets/category_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  API api = API();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: MyText(
          text: "News",
          size: 18,
          isBold: true,
        ),
        elevation: 1,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.info_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'Choose News Category:',
                size: 18,
                isBold: true,
              ),
              const SizedBox(height: 30),
              const Divider(
                height: 1,
                indent: 1,
                thickness: 0.5,
                color: Colors.black,
              ),
              CategoryItem(),
              const Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.black,
              ),
              const SizedBox(height: 30),
              MyText(
                text: 'Best News:',
                size: 18,
                isBold: true,
              ),
              const SizedBox(height: 10),
              News(),
            ],
          ),
        ),
      ),
    );
  }
}
