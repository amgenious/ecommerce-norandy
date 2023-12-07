import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:norandy_app/main.dart';
import 'package:norandy_app/pages/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
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
      body: Form(
        key: formKey,
        child: ListView(
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
              "Sign Up",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.amberAccent),
            ),
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
                      style: TextStyle(fontSize: 16, color: Colors.amberAccent),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextFormField(
                      style: const TextStyle(color: Colors.amberAccent),
                      textInputAction: TextInputAction.next,
                      controller: emailcontroller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                          email != null && EmailValidator.validate(email)
                              ? "Enter valid email"
                              : null,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(
                                  color: Colors.amberAccent,
                                  width: 1.0,
                                  style: BorderStyle.solid)),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.amberAccent)),
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
                      style: const TextStyle(color: Colors.amberAccent),
                      textInputAction: TextInputAction.done,
                      controller: passwordcontroller,
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 5
                          ? "Enter min. 5 characters"
                          : null,
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
                    signUp();
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(children: [
              const Text(
                "Already have account, ",
                style: TextStyle(color: Colors.amber),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return const SignInPage();
                    }),
                  );
                },
                child: const Text(
                  "Click here",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );
    } on FirebaseAuthException catch (error) {
      // ignore: avoid_print
      print(error);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text(
            error.message.toString(),
            style:const  TextStyle(color: Colors.red),
          ),
        ),
      );
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
