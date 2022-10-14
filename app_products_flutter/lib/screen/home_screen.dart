import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    
    return Scaffold(
       appBar: AppBar(
        title: const Text('SQLite Example with Cats'), 
        elevation: 0,
        backgroundColor: Colors.pink,),
      body: Container(
        child: Text("ssss"),
      ),
    );
  }
}

