import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myproject/screens/order.dart';
import 'package:myproject/screens/products.dart';
import 'package:provider/provider.dart';

import 'package:flutter/src/rendering/box.dart';

import '../bottom_navbar.dart';

import '../item.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final List<String> menuHead = [
    "ALL",
    "Vegetables",
    "Fruits",
    "Meat",
    "Frozen Food"
  ];

  List<bool> menuSelected = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Consumer(
        builder: (context, Item item, widget) {
          var data = "Popular Near You";
          var data2 = "Top Deal";
          return ((Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 37,
                        height: 37,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/ic_locate.png"))),
                      ),
                      RichText(
                        text: TextSpan(
                          children: const <TextSpan>[
                            TextSpan(
                                text: "Los Angeles",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                            TextSpan(
                                text: ' \nMain rainway Station',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 11)),
                          ],
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => orderScreen(),
                              ));
                        },
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage("assets/ic_basket.png"),
                                  fit: BoxFit.none),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 4,
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 2),
                    child: Material(
                      elevation: 5,
                      shadowColor: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          hintText: "Try ''Tomatos'' ",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: ListView.builder(
                      itemCount: menuHead.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return TextButton(
                          onPressed: () {
                            setState(() {
                              menuSelected = List.filled(
                                  menuSelected.length, false,
                                  growable: true);
                              menuSelected[index] = !menuSelected[index];
                            });
                          },
                          child: Text(
                            menuHead[index],
                            style: TextStyle(
                              fontSize: 13,
                              color: menuSelected[index]
                                  ? Color(0xffFFC532)
                                  : Color(0xff939393),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 120,
                    alignment: Alignment.center,
                    child: PageView.builder(
                      itemCount: item.sliderMenu!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                            width: 360,
                            margin: EdgeInsets.all(7.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage(
                                      item.sliderMenu![index]["image"]),
                                  fit: BoxFit.cover,
                                )));
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    width: 320,
                    height: 25,
                    child: Text(
                      data2,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ),
                  listTopDeal(item),
                  Container(
                    margin: EdgeInsets.only(top: 14, bottom: 4, right: 14),
                    width: 320,
                    height: 25,
                    child: Text(
                      data,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: item.popularProducts!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 110,
                          height: 160,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 4,
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                ),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print(index);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => productScreen(
                                        viewId: index,
                                        direct: item.popularProducts![index]
                                            ["id"],
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 88,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "${item.popularProducts![index]["image"]}"),
                                        fit: BoxFit.contain),
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                child: Text(
                                    "${item.popularProducts![index]["title"]}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500)),
                              ),
                              Container(
                                width: 120,
                                margin: EdgeInsets.only(left: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 40,
                                      child: RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text:
                                                    "\$${item.popularProducts![index]["price"]}/kg",
                                                style: TextStyle(
                                                    color: Color(0xff52CA73),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text: ' \nSave \$1 off',
                                                style: TextStyle(
                                                    color: Color(0xffFF0202),
                                                    fontSize: 8)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            item.addBasket(item.basket![index]);
                                          });
                                        },
                                        icon: Image.asset(
                                          "assets/ic_add_btn.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            // bottomNavigationBar: bottomNavbar(),
          )));
        },
      ),
    );
  }

  Container listTopDeal(Item item) {
    return Container(
      width: double.infinity,
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: item.topDealProducts!.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 10),
            width: 110,
            height: 160,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    print(index);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => productScreen(
                          viewId: index,
                          direct: item.topDealProducts![index]["id"],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 88,
                    height: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "${item.topDealProducts![index]["image"]}"),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  child: Text("${item.topDealProducts![index]["title"]}",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                ),
                Container(
                  width: 120,
                  margin: EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 70,
                        height: 40,
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      "\$${item.topDealProducts![index]["price"]}/kg",
                                  style: TextStyle(
                                      color: Color(0xff52CA73),
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ' \nSave \$1 off',
                                  style: TextStyle(
                                      color: Color(0xffFF0202), fontSize: 9)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        child: IconButton(
                          onPressed: () {
                            item.addBasket(item.topDealProducts![index]);
                          },
                          icon: Image.asset(
                            "assets/ic_add_btn.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
