import 'dart:ui';

import 'package:agfood/itemsPage.dart';
import 'package:agfood/util/ChangeThemeToggle.dart';
import 'package:agfood/util/menuItems.dart';
import 'package:agfood/login.dart';
import 'package:agfood/model/menuItem.dart';
import 'package:agfood/util/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  String username, email;

  HomePage({super.key, required this.username, required this.email});

  var imagesCarousel = [
    "assets/carousel1.jpg",
    "assets/carousel2.jpg",
    "assets/carousel3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    PopupMenuItem<MyMenuItem> buildItem(MyMenuItem item) =>
        PopupMenuItem<MyMenuItem>(
          value: item,
          child: Expanded(
            child: Row(children: [
              Icon(
                item.icon,
                color: Colors.grey[850],
                size: 25,
              ),
              Text(item.text),
              const ChangeThemeToggle()
            ]),
          ),
        );

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('AGFood'),
          backgroundColor: const Color(0xff54BAB9),
          actions: [
            PopupMenuButton<MyMenuItem>(
              itemBuilder: (context) => [
                ...MenuItems.itemList.map(buildItem).toList(),
              ],
            )
          ],
        ),
        drawer: Drawer(
          backgroundColor: const Color(0xff54BAB9),
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(username),
                accountEmail: Text(email),
                currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                  child: Image.asset('assets/user.png'),
                )),
                decoration: const BoxDecoration(color: Color(0xff9ED2C6)),
              ),
              ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 30,
                  ),
                  title: const Text(
                    'Home Page',
                    style: TextStyle(
                        color: Color(0xFFF7ECDE),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onTap: () {}),
              ListTile(
                leading: const Icon(
                  Icons.fastfood,
                  color: Colors.white,
                  size: 30,
                ),
                title: const Text(
                  'Items Page',
                  style: TextStyle(
                      color: Color(0xFFF7ECDE),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ItemsPage(username: username, email: email);
                  }));
                },
              ),
              const Divider(
                thickness: 2.0,
                height: 20.0,
                indent: 10.0,
                endIndent: 10.0,
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 30,
                ),
                title: const Text(
                  'Log out',
                  style: TextStyle(
                      color: Color(0xFFF7ECDE),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }));
                },
              )
            ],
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/background3.jpg'),
                        fit: BoxFit.cover)),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Column(children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Home Page",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Card(
                              elevation: 10,
                              color: Colors.blueGrey.shade400.withOpacity(0.7),
                              child: SizedBox(
                                  width: 375,
                                  height: 250,
                                  child: Column(children: [
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          "About Us",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'OpenSans',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Column(children: const [
                                        Text(
                                            "\t\tAGFood is a start up who provide a food delivery, carried out buy hundreds of millions of driver and have more than 125,000 restaurants in various cities have officially become partners",
                                            textAlign: TextAlign.justify),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "\t\tAGFood's food quality is guaranteed with the presence of AGFood partners who are ready to deliver your food quickly and swiftly. Not only that, you can also enjoy many promos and free shipping that are available every day. Because of its advantages, AGFood is now the choice of many people to order food from home.",
                                          textAlign: TextAlign.justify,
                                        )
                                      ]),
                                    )
                                  ])),
                            )),
                        const SizedBox(height: 15.0),
                        const Text(
                          "Special Offers",
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        CarouselSlider(
                          items: imagesCarousel
                              .map((e) => Image.asset(e))
                              .toList(),
                          options: CarouselOptions(
                            aspectRatio: 3.0,
                            height: 200,
                            autoPlay: true,
                            viewportFraction: 0.9,
                            enlargeCenterPage: true,
                            autoPlayInterval: const Duration(seconds: 5),
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
