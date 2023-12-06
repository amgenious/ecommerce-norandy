import 'package:flutter/material.dart';
import '../models/categories_model.dart';
import '../models/deals_model.dart';
import '../utils/constant.dart';
import '../pages//details.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.black,
        
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 179, 64),
                      hintText: 'Search Item Here',
                      hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      icon: Icon(Icons.search),
                      iconColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Categories",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 179, 64), fontSize: 12),
                ),
                const SizedBox(
                  height: 10,
                ),
                //this is the categories page
                SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (ctx, index) {
                        CategoriesModel current = categories[index];
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(current.imageUrl),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                current.title,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        );
                      },
                    )),
                //end of the categories page
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Top Deals",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 179, 64), fontSize: 12),
                ),
                const SizedBox(
                  height: 10,
                ),
                // this section for top deals
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  width: double.infinity,
                  height: size.height,
                  child: GridView.builder(
                    controller: ScrollController(),
                    scrollDirection: Axis.vertical,
                      itemCount: deals.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.63),
                      itemBuilder: (context, index) {
                        DealsModel current = deals[index];
                        return GestureDetector(
                          onTap: (() => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  return DetailsPage(
                                    data: current,
                                    isdealsmodel:true
                                  );
                                }),
                              )),
                        child:SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                width: size.width,
                                height: size.height * 0.28,
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  image: DecorationImage(
                                    image: AssetImage(current.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 4,
                                      color: Color.fromARGB(61, 0, 0, 0),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 1.0),
                                child: Text(
                                  current.name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: "Ghc",
                                      style: const TextStyle(
                                        color: Colors.amber,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                    TextSpan(
                                      text: current.price.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ])),
                            ],
                          ),
                        )
                        );
                      }),
                ),
                // end of section for the top deals
              ],
            )
          ],
        ));
  }
}
