import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tea_salon/main.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  final Decoration decoradtion = BoxDecoration(
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
  );
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.all(14),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Create Acoount',
                  style: TextStyle(fontSize: 38),
                ),
                const Text(
                  'Order your favorite Coffee from Our shop',
                  style: TextStyle(
                      fontSize: 28, color: Color.fromARGB(255, 173, 171, 171)),
                ),
                // email field
                Container(
                  decoration: decoradtion,
                  width: width * 0.9,
                  child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      controller: emailController,
                      validator: (value) {
                        if (value == null || !EmailValidator.validate(value)) {
                          return 'enter a valid email';
                        }
                        return null;
                      }),
                ),
                // password field
                Container(
                  decoration: decoradtion,
                  width: width * 0.9,
                  child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Type your password',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'min 6 carachters';
                        }
                        return null;
                      }),
                ),
                // password confirmation
                Container(
                  decoration: decoradtion,
                  width: width * 0.9,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Retype your password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    controller: passwordConfirmationController,
                    validator: (value) {
                      if (value == null) {
                        return 'you must retype your password';
                      } else if (value != passwordController.text) {
                        return 'must match your password';
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(onPressed: SignUp, child: const Text('Signup'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future SignUp() async {
    final isvalid = formkey.currentState!.validate();
    if (!isvalid) return;
    //loading
    showDialog(
      context: context,
      builder: (context) => Center(
        child: Image.asset('assets/images/loading.gif'),
      ),
    );
    // Signup
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      navigatorkey.currentState!.pop();
      Get.back();
    } on FirebaseAuthException catch (e) {
      navigatorkey.currentState!.pop();
      Get.snackbar(e.message.toString(), 'Try again',
          duration: const Duration(seconds: 2));
    }
  }
}
