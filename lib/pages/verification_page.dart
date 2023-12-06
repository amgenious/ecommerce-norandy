import 'package:flutter/material.dart';
import 'package:norandy_app/pages/update_password_page.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
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
            "Verification",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Please enter the verification code below",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: const Text("Verification Code")),
              const SizedBox(
                width: 120,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: const Text("Resend Code", style: TextStyle(color: Colors.blueAccent),)),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 60,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              SizedBox(
                height: 50,
                width: 60,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              SizedBox(
                height: 50,
                width: 60,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              SizedBox(
                height: 50,
                width: 60,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 150,),
                SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (BuildContext context) {
                      return const UpdatePasswordPage();
                    }));
                  },
                  child: const Text("Continue", style: TextStyle(fontSize: 20),)),
            ),
        ],
      ),
    );
  }
}
