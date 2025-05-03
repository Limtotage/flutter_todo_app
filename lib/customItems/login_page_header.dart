import 'package:flutter/material.dart';

class LoginHeader extends StatefulWidget {
  const LoginHeader({super.key});

  @override
  State<LoginHeader> createState() => _LoginHeaderState();
}

class _LoginHeaderState extends State<LoginHeader> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
        decoration: const BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
              image: AssetImage("lib/assets/images/greenHeader.png"),
              fit: BoxFit.cover),
        ),
        width: deviceWidth,
        height: deviceHeight / 3,
        child: Padding(
          padding: EdgeInsets.fromLTRB(90, 65, 0, 0),
          child: Text(
            "My Todo App",
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
