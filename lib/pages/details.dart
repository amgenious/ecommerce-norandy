import 'package:flutter/material.dart';
import 'package:norandy_app/utils/colors.dart';
import 'package:norandy_app/widget/add_to_cart.dart';

import '../../models/deals_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    required this.data,
    super.key,
    required this.isdealsmodel,
  });

  final DealsModel data;
  final bool isdealsmodel;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    DealsModel current = widget.data;

    return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: const Color.fromARGB(255, 255, 179, 64),
          title: const Text(
            "Details",
          ),
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Stack(
                  children: [
                    Hero(
                      tag: widget.isdealsmodel ? current.imageUrl : current.id,
                      child: Container(
                        width: size.width,
                        height: size.height * 0.5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(current.imageUrl),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: size.width,
                        height: size.height * 0.10,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: gradient),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(current.name,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 179, 64),
                                  fontSize: 25)),
                          RichText(
                            text: TextSpan(
                              text: "Ghc",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              children: [
                                TextSpan(
                                  text: current.price.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      const Text(
                        "Description",
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 179, 64)),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 5)),
                      const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ac tincidunt justo, a egestas nibh. Quisque id purus orci. Mauris metus sapien, luctus sit amet felis fringilla, interdum accumsan lorem. Proin at elementum ipsum, a lobortis justo. Aenean ultrices volutpat egestas. Curabitur venenatis maximus vulputate. Phasellus maximus mi nec ex fermentum consectetur.",
                        style: TextStyle(color: Colors.white),
                        maxLines:
                            int.fromEnvironment("defaultPort", defaultValue: 4),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 20)),
                      SizedBox(
                        width: size.width,
                        height: 50,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 255, 179, 64))),
                            onPressed: () {
                              AddToCart.addtocart(current, context);
                            },
                            child: const Text(
                              "Add to Cart",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 20),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
