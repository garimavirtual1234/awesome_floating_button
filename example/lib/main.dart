import 'package:awesome_floating_button/awesome_floating_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'Awesome Floating Button'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
         centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(),
      floatingActionButton:    AwesomeFloatingButton(
        buttonBgColor: Colors.blue,
        iconColor: Colors.white,
        iconButtonList: [
          //icon1
          IconButton(
            color: Colors.white, onPressed: () {
            print("tab1");
          }, icon: const Icon(Icons.phone_forwarded),
          ),
          //icon2
          IconButton(
            color: Colors.white, onPressed: () {
            print("tab2");
          },
            icon: const Icon(Icons.gif_box),
            //size: 20,
          ),
          //icon3
          IconButton(
            color: Colors.white, onPressed: () {
            print("tab3");
          }, icon: const Icon(Icons.mail),
          ),
          //icon4
          IconButton(
            color: Colors.white, onPressed: () {
            print("tab4");
          }, icon: const Icon(Icons.person),
          ),
      ],
      )
    );
  }
}
