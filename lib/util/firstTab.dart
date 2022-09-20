import 'package:agfood/model/comments.dart';
import 'package:flutter/material.dart';
import 'package:agfood/util/globals.dart' as globals;

class FirstTab extends StatelessWidget {
  String username;
  int itemId;
  String itemTitle;
  String itemDescription;
  String itemImage;
  String itemPrice;
  FirstTab(
      {super.key,
      required this.username,
      required this.itemId,
      required this.itemTitle,
      required this.itemDescription,
      required this.itemImage,
      required this.itemPrice});

  @override
  Widget build(BuildContext context) {
    TextEditingController commentController = TextEditingController();
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xff9ED2C6),
        ),
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          SizedBox(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  itemImage,
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xff54BAB9),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade800.withOpacity(0.9),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(0, 3))
                ],
              ),
              height: 320,
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                    child: Text(
                      itemTitle,
                      style: const TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                    child: SizedBox(
                      height: 100,
                      child: Text(
                        itemDescription,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          itemPrice,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Colors.red.shade400, fontSize: 18.0),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 3.0,
                    color: Color(0xff9ED2C6),
                    indent: 12.0,
                    endIndent: 12.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                    child: Text(
                      "Enter your comment about this product: ",
                      style: TextStyle(fontFamily: 'OpenSans', fontSize: 15.0),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: commentController,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10.0),
                          filled: true,
                          fillColor: const Color(0xff9ED2C6),
                          hintText: "Enter your comment",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.send_rounded),
                            onPressed: () {
                              if (commentController.text.isEmpty) {
                                // showDialog(
                                //     context: context,
                                //     builder: (context) {
                                //       return AlertDialog(
                                //         title: const Text("Error"),
                                //         content:
                                //             const Text("Comment cannot be empty"),
                                //         actions: [
                                //           TextButton(
                                //               onPressed: () {
                                //                 Navigator.pop(context);
                                //               },
                                //               child: const Text("OK!"))
                                //         ],
                                //       );
                                //     });

                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Comment field cannot be empty")));
                              } else {
                                globals.commentList.add(Comments(
                                    commentId: itemId,
                                    username: username,
                                    comment: commentController.text));
                                commentController.text = "";
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Success"),
                                        content: const Text(
                                            "Your comment has been added!"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("OK!"))
                                        ],
                                      );
                                    });
                              }
                            },
                          )),
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
