import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:norandy_app/main.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
 @override
  void dispose() {
    emailcontroller.dispose();

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
            "Forget Password",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 179, 64)),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Please enter your email below to receive reset password email", style: TextStyle(color: Colors.amber),),
          SizedBox(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                      TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: emailcontroller,
                      style: const TextStyle(color: Color.fromARGB(255, 255, 179, 64)),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                          email != null && EmailValidator.validate(email)
                              ? "Enter valid email"
                              : null,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 0, 0, 0),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 179, 64),
                                  width: 1.0,
                                  style: BorderStyle.solid)),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.amberAccent)),
                    ),
                    const SizedBox(height: 150,),
                    SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color.fromARGB(255, 255, 179, 64))),
                  onPressed: () {resetPassword();},
                  child: const Text("Get Email", style: TextStyle(fontSize: 20,color: Colors.black),)),
            ),
                  ],
                )),
        ],
      ),
    );
  }
  Future resetPassword() async{
     showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try{
      await FirebaseAuth.instance
    .sendPasswordResetEmail(email: emailcontroller.text.trim());

     // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:Text("Password Reset Email sent"),
        ),
      );
     navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }on FirebaseAuthException catch(e){
     
     // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content:Text(e.message.toString()),
        ),
      );
    }

  }
}
