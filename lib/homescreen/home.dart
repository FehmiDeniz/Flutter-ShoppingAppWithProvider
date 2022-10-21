import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/src/rendering/box.dart';

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

  final List<String> sliderMenuImages = [
    "assets/ic_menu.png",
    "assets/ic_menu.png",
    "assets/ic_menu.png"
  ];

  List<bool> menuSelected = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Consumer(
        builder: (context, Item item, widget) {
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
                      Container(
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
                      itemCount: sliderMenuImages.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                            width: 360,
                            margin: EdgeInsets.all(7.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage(sliderMenuImages[index]),
                                  fit: BoxFit.cover,
                                )));
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 180,
                    //padding: EdgeInsets.all(),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: item.Products!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(5),
                          width: 122,
                          height: 172,
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
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 88,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "${item.Products![index]["image"]}"),
                                        fit: BoxFit.contain),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  child: Text(
                                      "${item.Products![index]["title"]}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500)),
                                ),
                                Container(
                                  width: 120,
                                  margin: EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: const <TextSpan>[
                                            TextSpan(
                                                text: "\$ 5.10/kg",
                                                style: TextStyle(
                                                    color: Color(0xff52CA73),
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            TextSpan(
                                                text: ' \nSave \$1 off',
                                                style: TextStyle(
                                                    color: Color(0xffFF0202),
                                                    fontSize: 11)),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.add))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )));
        },
      ),
    );
  }

/*Consumer(
        builder: (context, Item item, widget) {
          return (SafeArea(
            top: true,
            child: (Scaffold(
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
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
                        Container(
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
                        itemCount: sliderMenuImages.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                              width: 360,
                              margin: EdgeInsets.all(7.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image: AssetImage(sliderMenuImages[index]),
                                    fit: BoxFit.cover,
                                  )));
                        },
                      ),
                    ),
                    ListView.builder(
                      itemCount: item.Products!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 122,
                          height: 172,
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
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 88,
                                  height: 90,
                                  child: Image.network(
                                      "${item.Products![index]["image"]}"),
                                ),
                                Container(
                                  width: 100,
                                  child: RichText(
                                    text: TextSpan(
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: "Strawberry",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500)),
                                        TextSpan(
                                            text: ' \nOrganic',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 11)),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 120,
                                  margin: EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: const <TextSpan>[
                                            TextSpan(
                                                text: "\$ 5.10/kg",
                                                style: TextStyle(
                                                    color: Color(0xff52CA73),
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            TextSpan(
                                                text: ' \nSave \$1 off',
                                                style: TextStyle(
                                                    color: Color(0xffFF0202),
                                                    fontSize: 11)),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.add))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            )),
          ));
        },
      );
 */
}
