import 'package:agfood/detailPage.dart';
import 'package:agfood/home.dart';
import 'package:agfood/model/item.dart';
import 'package:agfood/login.dart';
import 'package:agfood/model/menuItem.dart';
import 'package:agfood/util/ChangeThemeToggle.dart';
import 'package:agfood/util/menuItems.dart';
import 'package:flutter/material.dart';

class ItemsPage extends StatefulWidget {
  String username;
  String email;
  ItemsPage({super.key, required this.username, required this.email});

  var items = [
    Items(
        id: 1,
        title: 'Siomay Bandung',
        image: 'assets/itemsImage/siomay.jpg',
        description:
            'Siomay asli bandung yang rasanya enak sekali. Bumbu kacang dan kecap langsung dari Bandung.',
        price: "Rp 10.000,00"),
    Items(
        id: 2,
        title: 'Nasi Padang',
        image: 'assets/itemsImage/nasiPadang.png',
        description: 'Nasi Padang yang rasanya Padang banget.',
        price: "Rp 18.000,00"),
    Items(
        id: 3,
        title: 'Ayam Geprek',
        image: 'assets/itemsImage/ayamGeprek.png',
        description: 'Ayam geprek dengan berbagai pilihan level kepedasan.',
        price: "Rp 16.000,00"),
    Items(
        id: 4,
        title: 'Soto Betawi',
        image: 'assets/itemsImage/sotoBetawi.png',
        description: 'Soto Betawi dengan santan yang gurih',
        price: "Rp 25.000,00"),
    Items(
        id: 5,
        title: 'Mie Ayam',
        image: 'assets/itemsImage/mieAyam.jpg',
        description: 'Mie ayam doa ibu',
        price: "Rp 13.000,00"),
    Items(
        id: 6,
        title: 'Gado-gado',
        image: 'assets/itemsImage/gadoGado.jpg',
        description: 'Gado-gado dengan bumbu kacang spesial',
        price: "Rp 12.000,00"),
  ];

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              accountName: Text(widget.username),
              accountEmail: Text(widget.email),
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
                onTap: () => {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return HomePage(
                          email: widget.email,
                          username: widget.username,
                        );
                      }))
                    }),
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
              onTap: () {},
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
          child: Stack(
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(height: 15),
                const Text(
                  "Items Page",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: widget.items.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 10.0),
                            child: Card(
                              color: const Color(0xff9ED2C6),
                              child: ListTile(
                                title: Text(widget.items[index].title),
                                subtitle: Text(
                                  widget.items[index].price,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(color: Colors.red.shade400),
                                ),
                                leading: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: OverflowBox(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                        image: AssetImage(
                                            widget.items[index].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                trailing: const Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DetailPage(
                                      itemId: widget.items[index].id,
                                      itemTitle: widget.items[index].title,
                                      itemDescription:
                                          widget.items[index].description,
                                      itemImage: widget.items[index].image,
                                      username: widget.username,
                                      itemPrice: widget.items[index].price,
                                    );
                                  }));
                                },
                              ),
                            ),
                          );
                        }))
              ],
            ),
          )
        ],
      )),
    );
  }
}
