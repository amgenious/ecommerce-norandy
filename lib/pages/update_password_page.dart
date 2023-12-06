import 'package:flutter/material.dart';
import 'package:norandy_app/pages/signin.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({super.key});

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          const SizedBox( height:30,),
          const Text("Update Password", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          const SizedBox(height: 40,),
          const Text("Enter your email, new password and confirm password"),
          const SizedBox( height:30,),
          SizedBox(
                width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        hintText: 'Email',
                      ),
                    ),
                  ],
                ),),
             const SizedBox(height: 25,),   
             SizedBox(
                width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "New Password",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        hintText: 'New Password',
                      ),
                    ),
                  ],
                ),),
                const SizedBox(height: 25,),   
             SizedBox(
                width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Confirm Password",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        hintText: 'Confirm Password',
                      ),
                    ),
                  ],
                ),),
                const SizedBox(height: 20,),
                 SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (BuildContext context) {
                      return const SignInPage();
                    }));
                  },
                  child: const Text("Update", style: TextStyle(fontSize: 20),)),
            ),
        ],
      ),
    );
  }
}