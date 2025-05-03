import 'package:flutter/material.dart';

class AddHeaderItem extends StatefulWidget {
  const AddHeaderItem({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  State<AddHeaderItem> createState() => _AddHeaderItemState();
}

class _AddHeaderItemState extends State<AddHeaderItem> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: deviceWidth,
      height: deviceHeight / 10,
      decoration: BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
              image: AssetImage("lib/assets/images/addNewTaskHeader.png"),
              fit: BoxFit.cover)),
      child: Row(
        spacing: 80,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: widget.onTap,
              child: Image.asset("lib/assets/images/back_button.png"),
            ),
          ),
          Text(
            "Add New Task",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 21),
          )
        ],
      ),
    );
  }
}
