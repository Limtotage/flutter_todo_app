import 'package:flutter/material.dart';

class GestureIconsItem extends StatefulWidget {
  const GestureIconsItem({super.key, required this.path});
  final String path;
  @override
  State<GestureIconsItem> createState() => _GestureIconsItemState();
}

class _GestureIconsItemState extends State<GestureIconsItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(milliseconds: 300),
            content: Text("Task Selected.")));
      },
      child: Image.asset(widget.path),
    );
  }
}
