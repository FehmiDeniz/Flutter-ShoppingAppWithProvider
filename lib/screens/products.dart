import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myproject/item.dart';
import 'package:provider/provider.dart';

import 'order.dart';

class productScreen extends StatefulWidget {
  final int viewId;
  final int direct;
  const productScreen({super.key, required this.viewId, required this.direct});

  @override
  State<productScreen> createState() => _productScreenState();
}

class _productScreenState extends State<productScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Consumer(builder: (context, Item item, widgt) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 800,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 400,
                            height: 50,
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 4,
                                          blurRadius: 6,
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        Navigator.pop(context);
                                        item.clearRamBasket();
                                        item.pieces = 0;
                                      });
                                    },
                                    icon: Icon(Icons.arrow_back_sharp),
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
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/ic_basket.png"),
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
                          ),
                          Container(
                            width: 360,
                            height: 50,
                            child: Text(
                              widget.direct <= 3
                                  ? "${item.topDealProducts![widget.viewId]["title"]}"
                                  : "${item.popularProducts![widget.viewId]["title"]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 31),
                            ),
                          ),
                          Container(
                            width: 400,
                            height: 300,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                              widget.direct <= 3
                                  ? "${item.topDealProducts![widget.viewId]["image"]}"
                                  : "${item.popularProducts![widget.viewId]["image"]}",
                            ))),
                          ),
                          Container(
                            width: 360,
                            height: 50,
                            child: Row(
                              children: [
                                Container(
                                  width: 150,
                                  child: Text(
                                    widget.direct <= 3
                                        ? "\$ ${item.topDealProducts![widget.viewId]["price"]}/kg"
                                        : "\$ ${item.popularProducts![widget.viewId]["price"]}/kg",
                                    style: TextStyle(
                                        color: Color(0xff52CA73),
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: 200,
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[400],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: IconButton(
                                          onPressed: () {
                                            item.pieces > 0
                                                ? item.pieces--
                                                : item.pieces = 0;
                                            if (widget.direct <= 3) {
                                              item.removeRamPrice(
                                                  item.topDealProducts![
                                                      widget.viewId]);
                                            } else if (widget.direct > 3) {
                                              item.removeRamPrice(
                                                  item.popularProducts![
                                                      widget.viewId]);
                                            }
                                          },
                                          icon: Icon(Icons.remove),
                                          iconSize: 20,
                                        ),
                                      ),
                                      Container(
                                        width: 90,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[400],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(
                                            "${item.pieces}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[400],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              item.pieces++;

                                              if (widget.direct <= 3) {
                                                item.addRamPrice(
                                                    item.topDealProducts![
                                                        widget.viewId]);
                                              } else if (widget.direct > 3) {
                                                item.addRamPrice(
                                                    item.popularProducts![
                                                        widget.viewId]);
                                              }
                                              print(item.ramBasket!.length);
                                            });
                                          },
                                          icon: Icon(Icons.add),
                                          iconSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 360,
                            height: 30,
                            child: Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 220,
                            child: Text(
                              widget.direct <= 3
                                  ? "${item.topDealProducts![widget.viewId]["description"]}"
                                  : "${item.popularProducts![widget.viewId]["description"]}",
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    child: Container(
                      width: 360,
                      height: 90,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.8),
                              spreadRadius: 30,
                              blurRadius: 10,
                              blurStyle: BlurStyle.normal,
                              offset: Offset(0, 0),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(10)),
                          color: Colors.yellow[100]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 50,
                            width: 120,
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Price",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  TextSpan(
                                    text: "\n\$ ${item.ramPrice}",
                                    style: TextStyle(
                                        color: Color(0xff52CA73),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.white,
                            child: InkWell(
                              splashColor: Colors.red,
                              onTap: () {
                                for (var i in item.ramBasket!) {
                                  item.addBasket(i);
                                }
                              },
                              child: Container(
                                width: 140,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.green[600],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.shopping_basket,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Add To Basket",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
