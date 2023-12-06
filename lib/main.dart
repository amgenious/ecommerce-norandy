import 'package:flutter/material.dart';
import 'pages/signin.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}):super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
          child: Text("Welcome to Norandy's Mall", style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold, color: Colors.amber),),  
          ),
            ElevatedButton(
              style:const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return const SignInPage();
                    }),
                  );
                },
                child: const Text("Get Started", style: TextStyle(color: Colors.black),),
              ),
        ],
      )
    );
  }
}
