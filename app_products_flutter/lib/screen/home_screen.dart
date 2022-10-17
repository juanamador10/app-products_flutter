import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        //title: const Text('SQLite Example with Cats'), 
        elevation: 0,
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined)),
        ],),
      body: Container(
        /*padding: const EdgeInsets.all(10.0),*/
        margin: const EdgeInsets.all(10.0),
        color: Colors.amber[600],
        child: ListView(
          scrollDirection: Axis.vertical,
          //shrinkWrap: true,
          children: [
            // - - - - - - - - - - Columns - - ->
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text("data"),
                    const Text("data"),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text("aaa"),
                    const Text("daaaata"),
                  ],
                )
              ],
            ),
          ],
        )
      ),
    );
  }
}

