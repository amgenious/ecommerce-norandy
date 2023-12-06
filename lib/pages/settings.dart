import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
          padding: const EdgeInsets.all(20.0),
        children: const [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Settings", style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
            ],
          )
        ],
      )
    );
  }
}
