import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants/color.dart';
import 'package:flutter_todo_app/customItems/custom_button.dart';
import 'package:flutter_todo_app/customItems/login_page_header.dart';
import 'package:flutter_todo_app/services/auth.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginRagisterPage extends StatefulWidget {
  const LoginRagisterPage({super.key});

  @override
  State<LoginRagisterPage> createState() => _LoginRagisterPageState();
}

class _LoginRagisterPageState extends State<LoginRagisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLogin = true;
  String? errorMessage;

  void showMessage(String message, bool isError) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: Duration(milliseconds: 700),
        content: Text(message),
      ),
    );
  }

  Future<void> createuser() async {
    try {
      await Auth().createUser(
          email: emailController.text, password: passwordController.text);
      showMessage("Register Successful", false);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
      showMessage("Register Error. Password or Email is invalid.", true);
    }
  }

  Future<void> userLogin() async {
    try {
      await Auth().userLogin(
          email: emailController.text, password: passwordController.text);
      showMessage("Login Successful", false);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
      showMessage("Login Error. Password or Email is incorrect.", true);
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          backgroundColor: HexColor(backGroundColor),
          body: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 100.0),
                  child: LoginHeader(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: "Enter Your E-mail",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: "Enter Your Password",
                    ),
                  ),
                ),
                CustomButtonItem(
                    width: deviceWidth - 40,
                    height: 40,
                    text: isLogin ? "Login" : "Sign Up",
                    color: Color(0xFF327E3B),
                    textColor: Colors.white,
                    onPressed: () {
                      if (isLogin) {
                        userLogin();
                      } else {
                        createuser();
                      }
                    }),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child: isLogin
                        ? Text("Don't have an account yet? Press!")
                        : const Text("Already have an account? Press!")),
              ],
            ),
          )),
    );
  }
}
