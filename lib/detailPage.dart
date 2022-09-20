import 'package:agfood/secondTab.dart';
import 'package:agfood/util/ChangeThemeToggle.dart';
import 'package:agfood/util/firstTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailPage extends StatelessWidget {
  int itemId;
  String itemTitle;
  String itemDescription;
  String itemImage;
  String username;
  String itemPrice;
  DetailPage(
      {super.key,
      required this.itemId,
      required this.itemTitle,
      required this.itemDescription,
      required this.username,
      required this.itemImage,
      required this.itemPrice});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('AGFood'),
          backgroundColor: const Color(0xff54BAB9),
          elevation: 0,
        ),
        body: SafeArea(
            child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.info_outline)),
                Tab(icon: Icon(Icons.insert_comment_outlined))
              ],
              labelColor: Colors.blueGrey,
            ),
            Expanded(
                child: TabBarView(children: [
              FirstTab(
                itemId: itemId,
                itemTitle: itemTitle,
                itemDescription: itemDescription,
                itemImage: itemImage,
                username: username,
                itemPrice: itemPrice,
              ),
              SecondTab(postId: itemId)
            ]))
          ],
        )),
      ),
    );
  }
}
