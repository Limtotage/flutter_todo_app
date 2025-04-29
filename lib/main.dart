import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_todo_app/constants/color.dart';
//import 'package:flutter_todo_app/pages/login_register_page.dart';
import 'package:hexcolor/hexcolor.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backGroundColor),
          body: Column(
            children: [
              //Header
              Container(
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
                      padding: EdgeInsets.only(top: 25),
                      child: Text(
                        "Bugunun Tarihi",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
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
              ),
              //Top Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.notes_outlined,
                                  size: 40,
                                ),
                                Text(
                                  "Study Lesseon",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
                                ),
                                Checkbox(
                                    value: isChecked,
                                    onChanged: (val) => {
                                          setState(() {
                                            isChecked = val!;
                                          })
                                        })
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.notes_outlined,
                                  size: 40,
                                ),
                                Text(
                                  "Study Lesseon",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
                                ),
                                Checkbox(
                                    value: isChecked,
                                    onChanged: (val) => {
                                          setState(() {
                                            isChecked = val!;
                                          })
                                        })
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.notes_outlined,
                                  size: 40,
                                ),
                                Text(
                                  "Study Lesseon",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
                                ),
                                Checkbox(
                                    value: isChecked,
                                    onChanged: (val) => {
                                          setState(() {
                                            isChecked = val!;
                                          })
                                        })
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //Completed Text
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: const Text("Completed",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
                ),
              ),
              //Bottom Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.notes_outlined,
                                  size: 40,
                                ),
                                Text(
                                  "Study Lesseon",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
                                ),
                                Checkbox(
                                    value: isChecked,
                                    onChanged: (val) => {
                                          setState(() {
                                            isChecked = val!;
                                          })
                                        })
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.notes_outlined,
                                  size: 40,
                                ),
                                Text(
                                  "Study Lesseon",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
                                ),
                                Checkbox(
                                    value: isChecked,
                                    onChanged: (val) => {
                                          setState(() {
                                            isChecked = val!;
                                          })
                                        })
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.notes_outlined,
                                  size: 40,
                                ),
                                Text(
                                  "Study Lesseon",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
                                ),
                                Checkbox(
                                    value: isChecked,
                                    onChanged: (val) => {
                                          setState(() {
                                            isChecked = val!;
                                          })
                                        })
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //New task button
              ElevatedButton(onPressed: () {}, child: Text("Add New Data")),
            ],
          ),
        ),
      ),
      //home: const LoginRagistePage(),
    );
  }
}
