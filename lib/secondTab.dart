import 'package:flutter/material.dart';
import 'package:agfood/util/globals.dart' as globals;

class SecondTab extends StatefulWidget {
  int postId;
  SecondTab({super.key, required this.postId});

  @override
  State<SecondTab> createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  @override
  Widget build(BuildContext context) {
    if (!globals.commentList
        .any((element) => element.commentId == widget.postId)) {
      return Container(
        alignment: Alignment.center,
        child: const Text(
          "This item hasn't had any comment",
          style: TextStyle(
              fontFamily: "OpenSans",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(183, 28, 28, 1)),
        ),
      );
    } else {
      return Expanded(
          child: ListView.builder(
              itemCount: globals.commentList.length,
              itemBuilder: (context, index) {
                if (globals.commentList[index].commentId == widget.postId) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: Card(
                        color: const Color(0xff9ED2C6),
                        child: ListTile(
                          title: Text(
                            globals.commentList[index].username,
                            style: const TextStyle(
                                color: Color(0xFFF7ECDE), fontSize: 15.0),
                          ),
                          subtitle: Text(
                            globals.commentList[index].comment,
                            style: const TextStyle(fontSize: 20.0),
                            overflow: TextOverflow.ellipsis,
                          ),
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(
                                Icons.person_outlined,
                                color: Color(0xFFF7ECDE),
                                size: 40.0,
                              ),
                            ],
                          ),
                        )),
                  );
                } else {
                  return Container();
                }
              }));
    }
  }
}
