import 'package:flutter/material.dart';
import 'package:norandy_app/pages/verification_page.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Please enter your email below to receive your verification code"),
          SizedBox(
                width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        hintText: 'Valid Email',
                      ),
                    ),
                    const SizedBox(height: 150,),
                    SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (BuildContext context) {
                      return const VerificationPage();
                    }));
                  },
                  child: const Text("Get Code", style: TextStyle(fontSize: 20),)),
            ),
                  ],
                )),
        ],
      ),
    );
  }
}
