import 'package:apple_shop_ui/model/item_model.dart';
import 'package:apple_shop_ui/pages/logo_page.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ShakeDetector detector;
  int _countItemSelects = 0;
  bool isSelected = false;

  final List<Item> _listItem = [
    Item(itemImage: 'assets/images/image_1.jpeg'),
    Item(itemImage: 'assets/images/image_2.jpg'),
    Item(itemImage: 'assets/images/image_3.png'),
    Item(itemImage: 'assets/images/image_4.jpg'),
    Item(itemImage: 'assets/images/image_5.jpg'),
    Item(itemImage: 'assets/images/image_1.jpeg'),
    Item(itemImage: 'assets/images/image_2.jpg'),
    Item(itemImage: 'assets/images/image_3.png'),
    Item(itemImage: 'assets/images/image_4.jpg'),
    Item(itemImage: 'assets/images/image_5.jpg'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detector = ShakeDetector.autoStart(onPhoneShake: () {
      // Do stuff on phone shake
      Navigator.pushReplacementNamed(context, LogoPage.id);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    detector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade800,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        centerTitle: true,
        title: const Text("Apple Products"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 30,
              width: 38,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.yellow.shade800,
              ),
              child: Text(
                "$_countItemSelects",
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              /// #header
              Container(
                height: 230,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/image_4.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Lifestyle sale",
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.6, 50),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "shop Now",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              /// #body
              Expanded(
                child: GridView.count(
                  crossAxisCount: 1,
                  children: _listItem.map((e) => _itemOfElement(e)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemOfElement(Item e) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: GestureDetector(
        onTap: isSelected
            ? () {
                e.isSelectedItem = !e.isSelectedItem;
                setState(() {
                  e.isSelectedItem ? _countItemSelects++ : _countItemSelects--;
                });
                if (_countItemSelects == 0) {
                  isSelected = false;
                }
              }
            : () {},
        onLongPress: !isSelected
            ? () {
                e.isSelectedItem = true;
                setState(() {
                  _countItemSelects++;
                });
                isSelected = true;
              }
            : () {},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(e.itemImage),
                fit: BoxFit.cover,
              )),
          child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: e.isSelectedItem
                  ? Colors.blue.withOpacity(0.4)
                  : Colors.transparent,
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  e.isLike = !e.isLike;
                });
              },
              icon: e.isLike
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      size: 30,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
