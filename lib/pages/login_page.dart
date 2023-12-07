import 'package:flutter/material.dart';
import 'package:norandy_app/pages/signin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
           Center(
            child: Container(
              alignment: AlignmentDirectional.center,
              child: Image.asset(
                "assets/images/norandylogo.png",
                width: 200,
              ),
            ),
          ),
          const Text("Sign Up", textAlign: TextAlign.center, style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.amberAccent),),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(fontSize: 16 ,color: Colors.amberAccent),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.amberAccent, width: 1.0, style: BorderStyle.solid)
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.amberAccent)
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Password",
                      style: TextStyle(fontSize: 16, color: Colors.amberAccent),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.amberAccent, width: 1.0, style: BorderStyle.solid)
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.amberAccent)
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: size.width,
              height: 50,
              child: ElevatedButton(
                style:const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amberAccent)),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (BuildContext context) {
                      return const SignInPage();
                    }));
                  },
                  child: const Text("Sign Up", style: TextStyle(fontSize: 20),)),
            ),
        ],
      ),
    );
  }
}