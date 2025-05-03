import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Headeritem extends StatefulWidget {
  const Headeritem({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  State<Headeritem> createState() => _HeaderitemState();
}

class _HeaderitemState extends State<Headeritem> {
  final String today = DateFormat('dd.MM.yyyy').format(DateTime.now()); 
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Row(
              spacing: 85,
              children: [
                GestureDetector(
                  onTap: widget.onTap,
                  child: Image.asset("lib/assets/images/back_button.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Text(
                    today,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Text(
              "My Todo List",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
