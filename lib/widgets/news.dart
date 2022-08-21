// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_extend/share_extend.dart';
import 'package:url_launcher/url_launcher.dart';

import '../tools/api.dart';
import 'my_text.dart';

class News extends StatefulWidget {
  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    API api = API();
    return Expanded(
      child: FutureBuilder(
        future: api.getGeneralNews(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (() {
                          launchUrl(
                            Uri.parse(snapshot.data[i].url),
                          );
                        }),
                        child: Container(
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(
                                snapshot.data[i].urlToImage,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyText(
                          text: snapshot.data[i].title,
                          size: 15,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          ShareExtend.share(
                            snapshot.data[i].url,
                            'text',
                          );
                        },
                        icon: Platform.isIOS
                            ? const Icon(CupertinoIcons.share)
                            : const Icon(Icons.share),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
