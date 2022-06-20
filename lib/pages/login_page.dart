// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tea_salon/main.dart';
import 'package:tea_salon/pages/register_page.dart';
class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Hello Again!',
            style: TextStyle(fontSize: 38),
          ),
          const Text(
            'Let\'s see What you\'re drinking today',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28),
          ),
          //email filed
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  // color: const Color(0xFF777676).withOpacity(0.1),
                  color: const Color(0xFF141921).withOpacity(1),
                  spreadRadius: -2,
                  blurRadius: 2,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            width: width * 0.9,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Email',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              autofocus: true,
              controller: emailController,
            ),
          ),
          //password filed
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  // color: const Color(0xFF777676).withOpacity(0.1),
                  color: const Color(0xFF141921).withOpacity(1),
                  spreadRadius: -2,
                  blurRadius: 2,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            width: width * 0.9,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              controller: passwordController,
            ),
          ),
          // forget password button
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forget Your password?',
                  ))),
          //login button
          ElevatedButton(onPressed: login, child: const Text('Login')),
          const Text('- Or -'),
          Row(
            children: [
              // zidlna icon ta3 google hna
              //IconButton(onPressed: (){}, icon: icon),
              //zidlna icon ta3 fb hna
              //IconButton(onPressed: (){}, icon: icon),
            ],
          ),
          // register row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Dont have account?'),
              TextButton(
                  onPressed: () =>Get.to(()=>RegisterPage()),
                  child: const Text('Register now'))
            ],
          ),
          const SizedBox()
        ],
      ),
    );
  }

  Future login() async {
    //loading
    showDialog(
      context: context,
      builder: (context) => Center(
        child: Image.asset('assets/images/loading.gif'),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      // pop the loading
      navigatorkey.currentState!.pop();
    } on FirebaseAuthException catch (e) {
      navigatorkey.currentState!.pop();
      // TODO
      Get.snackbar(e.message.toString(), 'Try again',
          duration: const Duration(seconds: 2));
    }
    // to pop the loading
    // navigatorkey.currentState!.pop();
  }
}
