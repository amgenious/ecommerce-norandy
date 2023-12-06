import 'package:flutter/material.dart';
import '../../models/deals_model.dart';
import '../../utils/constant.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double calculateTotalPrice() {
    double total = 0.0;
    if (itemsOnCart.isEmpty) {
      total = 0;
    } else {
      for (DealsModel data in itemsOnCart) {
        total = total + data.price * data.value;
      }
    }
    return total;
  }

  void onDelete(DealsModel data) {
    setState(() {
      if (itemsOnCart.length == 1) {
        itemsOnCart.clear();
      } else {
        itemsOnCart.removeWhere((element) => element.id == data.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text(
                  "Cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                RichText(
                  text: TextSpan(
                    text: "Total Cost: ",
                    style: const TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    children: [
                      const TextSpan(
                          text: "Ghc ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 179, 64))),
                      TextSpan(
                        text: calculateTotalPrice().toString(),
                        style: const TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 255, 179, 64),
                        ),
                      )
                    ],
                  ),
                ),
                 IconButton(
                        onPressed: () {},
                        icon: const Icon(
                        Icons.handshake,
                        color: Colors.green,
                      ),
                    )
              ]),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: size.width,
                height: size.height,
                child: Stack(
                  children: [
                    SizedBox(
                      width: size.width,
                      height: size.height,
                      child: itemsOnCart.isEmpty
                          ? const Text(
                              "No item in cart",
                              style: TextStyle(color: Colors.white),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: itemsOnCart.length,
                              itemBuilder: (context, index) {
                                var current = itemsOnCart[index];
                                return SizedBox(
                                  width: size.width,
                                  height: size.height * 0.25,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                              offset: Offset(0, 4),
                                              blurRadius: 4,
                                              color: Color.fromARGB(
                                                  60, 255, 255, 255),
                                            )
                                          ],
                                          image: DecorationImage(
                                              image:
                                                  AssetImage(current.imageUrl),
                                              fit: BoxFit.cover),
                                        ),
                                        width: size.width * 0.35,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 1.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: size.width * 0.5,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    current.name,
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 255, 179, 64),
                                                        fontSize: 17),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      onDelete(current);
                                                    },
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            RichText(
                                                text: TextSpan(
                                                    text: "Ghc",
                                                    style: const TextStyle(
                                                      fontSize: 17,
                                                      color: Color.fromARGB(
                                                          255, 255, 179, 64),
                                                    ),
                                                    children: [
                                                  TextSpan(
                                                    text: current.price
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 17,
                                                    ),
                                                  )
                                                ])),
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: size.height * 0.048,
                                              ),
                                              width: size.width * 0.4,
                                              height: size.height * 0.04,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    width: size.width * 0.06,
                                                    height: size.height * 0.045,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                    ),
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      onTap: () {
                                                        setState(() {
                                                          if (current.value >
                                                              1) {
                                                            current.value--;
                                                          } else {
                                                            onDelete(current);
                                                            current.value = 1;
                                                          }
                                                        });
                                                      },
                                                      child: const Icon(
                                                        Icons.remove,
                                                        size: 16,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                size.width *
                                                                    0.02),
                                                    child: Text(
                                                      current.value.toString(),
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromARGB(
                                                            255, 255, 179, 64),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    width: size.width * 0.065,
                                                    height: size.height * 0.045,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      onTap: () {
                                                        setState(() {
                                                          current.value >= 0
                                                              ? current.value++
                                                              : null;
                                                        });
                                                      },
                                                      child: const Icon(
                                                        Icons.add,
                                                        size: 16,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
