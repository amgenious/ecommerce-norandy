import 'package:flutter/material.dart';
import 'package:norandy_app/main.dart';
import 'package:norandy_app/pages/forget_password_page.dart';
import 'package:norandy_app/pages/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignInPage> {
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (email) =>
                      //     email != null && EmailValidator.validate(email)
                      //         ? "Enter valid email"
                      //         : null,
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
                    signIn();
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
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const SignUpPage();
                        }),
                      );
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
      ),
    );
  }

  Future signIn() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );
    } on FirebaseAuthException catch (error) {
      // ignore: avoid_print
      print(error);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message.toString()),
        ),
      );
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
