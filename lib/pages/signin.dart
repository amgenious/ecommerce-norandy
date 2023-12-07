import 'package:flutter/material.dart';
import 'package:norandy_app/pages/forget_password_page.dart';
import 'package:norandy_app/utils/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignInPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();

    super.dispose();
  }

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
          const Text(
            "Sign In",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.amberAccent),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Email",
                    style: TextStyle(fontSize: 16, color: Colors.amberAccent),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: emailcontroller,
                    style: const TextStyle(color: Colors.amberAccent),
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 0, 0, 0),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                                color: Colors.amber,
                                width: 1.0,
                                style: BorderStyle.solid)),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.amberAccent)),
                  ),
                ],
              )),
          const SizedBox(
            height: 40,
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
                    textInputAction: TextInputAction.done,
                    controller: passwordcontroller,
                    obscureText: true,
                    style: const TextStyle(color: Colors.amberAccent),
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                                color: Colors.amberAccent,
                                width: 1.0,
                                style: BorderStyle.solid)),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.amberAccent)),
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
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.amberAccent)),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const Wrapper();
                  }));
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(fontSize: 20),
                )),
          ),
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            width: size.width,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const ForgetPassword();
                      }),
                    );
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 150,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (BuildContext context) {
                    //     return const LoginPage();
                    //   }),
                    // );
                    signIn();
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailcontroller.text.trim(),
      password: passwordcontroller.text.trim(),
    );
  }
}
