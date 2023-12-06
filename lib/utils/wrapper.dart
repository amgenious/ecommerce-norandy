import 'package:flutter/material.dart';
import 'package:norandy_app/pages/home_page.dart';
import 'package:norandy_app/pages/settings.dart';
import 'package:norandy_app/pages/cart.dart';
import 'package:norandy_app/pages/categories.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
    int currentPage = 0;
  List<Widget> pages =const [
    MainHomePage(),
    CategoriesPage(),
    CartPage(),
    SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           foregroundColor: Colors.black,
          backgroundColor: const Color.fromARGB(255, 255, 179, 64),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: const Text(
            "Ambi's Mall",
          ),
        ),
        body:pages[currentPage],
        bottomNavigationBar: NavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 179, 64), 
        indicatorColor: Colors.white, 
        destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.adf_scanner), label: 'Categories'),
        NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
      ],
        onDestinationSelected: (int index){
        setState((){
          currentPage = index;
        });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}