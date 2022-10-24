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
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Total: ${item.getPrice().toString()} \$  ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 17),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 4,
                                    blurRadius: 6,
                                    offset: Offset(0, 2),
                                  ),
                                ]),
                            child: IconButton(
                                onPressed: () {
                                  item.clearBasket();
                                },
                                icon: Icon(Icons.delete)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 3),
                      width: 300,
                      height: 20,
                      child: Text(
                        "Your Cart",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.red,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    item.basket!.isEmpty
                        ? Center(
                            child: Container(
                                alignment: Alignment.center,
                                width: 300,
                                height: 350,
                                child: Text("EMPTY")))
                        : Container(
                            width: double.infinity,
                            height: 360,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ListView.builder(
                              itemCount: item.basket!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 2,
                                          spreadRadius: 0.3,
                                        )
                                      ]),
                                  margin: EdgeInsets.all(10),
                                  width: 350,
                                  height: 100,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xffF2F2F2),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "${item.basket![index]["image"]}"))),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 100,
                                        height: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                alignment: Alignment.center,
                                                width: 100,
                                                child: Text(
                                                  "${item.basket![index]["title"]}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17),
                                                )),
                                            Container(
                                              alignment: Alignment.center,
                                              width: 60,
                                              child: Text(
                                                "\n\$ ${item.basket![index]["price"]}/kg",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff52CA73),
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 350,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1,
                              color: Colors.grey,
                              strokeAlign: StrokeAlign.inside)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Column(
                          children: [
                            Container(
                              width: 350,
                              child: Text(
                                "Delivery Location",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            ),
                            Container(
                              width: 350,
                              child: Row(
                                children: [
                                  Image.asset("assets/ic_locate.png"),
                                  Text(
                                    "827A - Main railway station, Los Angeles.",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 350,
                              child: Text(
                                "Arrive in",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 37),
                              width: 350,
                              child: Text(
                                "Your oder delivery by 15 min before.",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 350,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1,
                              color: Colors.grey,
                              strokeAlign: StrokeAlign.inside)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Column(
                          children: [
                            Container(
                              width: 350,
                              child: Text(
                                "Summary",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 17),
                              ),
                            ),
                            Container(
                              width: 350,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total items costs",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      ),
                                      Text(
                                        "${item.getPrice().toString()} \$  ",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset("assets/im_saved.png"),
                                          Text(
                                            "Saved",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "${item.getPrice() * 0.1} \$  ",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total shipping costs",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      ),
                                      Text(
                                        "${(item.getPrice()) - (item.getPrice() * 0.1)} \$  ",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
