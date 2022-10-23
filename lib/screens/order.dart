import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myproject/item.dart';

class orderScreen extends StatefulWidget {
  const orderScreen({super.key});

  @override
  State<orderScreen> createState() => _orderScreenState();
}

class _orderScreenState extends State<orderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Consumer(
        builder: (context, Item item, widget) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  width: 400,
                  height: 50,
                  child: Row(
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back_ios_new))),
                      Container(
                        width: 70,
                        height: 40,
                        child: Center(
                          child: Text(
                            "Checkout",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 40,
                        height: 40,
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
                ),
                Container(
                  width: double.infinity,
                  height: 500,
                  child: ListView.builder(
                    itemCount: item.basket!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 350,
                        color: Colors.white38,
                        height: 100,
                        child: Row(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "${item.basket![index]["image"]}"))),
                            ),
                            Container(
                              width: 100,
                              height: 90,
                              child: Column(
                                children: [
                                  Text("${item.basket![index]["title"]}"),
                                  Text(
                                      "\n\$ ${item.basket![index]["price"]}/kg"),
                                  Text("Save \$ off"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
