import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/src/rendering/box.dart';

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
  late int menuCurrent = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
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
                          style: TextStyle(color: Colors.grey, fontSize: 11)),
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
            Material(
              elevation: 5,
              shadowColor: Colors.grey,
              borderRadius: BorderRadius.circular(20),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 1),
                  hintText: "Try ''Tomatos'' ",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30)),
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                ),
              ),
            ),
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
                        menuSelected = List.filled(menuSelected.length, false,
                            growable: true);
                        menuSelected[index] = !menuSelected[index];
                        print(index);
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
                color: Colors.red,
                width: double.infinity,
                height: 120,
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CarouselSlider(
                        items: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage(sliderMenuImages[index]),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          scrollDirection: Axis.horizontal,
                        ),
                      );
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}


/*  CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(sliderMenuImages[0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 380.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ), */