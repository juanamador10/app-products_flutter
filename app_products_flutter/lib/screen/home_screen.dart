import 'package:app_products_flutter/models/product_card.dart';
import 'package:app_products_flutter/models/product_show_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  //final String changing_text;

  const HomeScreen({Key? key}) : super(key: key);
  
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

String imageLink= "Hola";
String name = "Name";
String position = "Positon";

class _HomeScreenState extends State<HomeScreen> {

  prodcutChange(String nameChange, String positionChange) {
       setState(() {name = nameChange; position = positionChange;});
    }

  @override
  Widget build(BuildContext context) {
    

    const textTitleStyle = TextStyle(fontSize: 18, color: Colors.brown);
    const textTitleBoldStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.brown);
    
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back, color: Colors.brown,)),
        //title: const Text('SQLite Example with Cats'), 
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.brown,)),
        ],),


      body: Container(
        /*padding: const EdgeInsets.all(10.0),*/
        margin: const EdgeInsets.all(20.0),
        color: Colors.white,
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
                    const Text("Hi, Juan", style: textTitleStyle,),
                  ],
                )
              ],
            ),

            const SizedBox(height: 18,),

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text("What's today taste?", style: textTitleBoldStyle,),
                  ],
                )
              ],
            ),
            
            const SizedBox(height: 18,),

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: () {}, icon: const Icon(Icons.fastfood_outlined), color: Colors.brown, iconSize: 35),
                        const SizedBox(width: 15,),

                        IconButton(onPressed: () {}, icon: const Icon(Icons.cake_outlined), color: Colors.brown, iconSize: 35),
                      ],
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined), color: Colors.brown, iconSize: 35,),

                  ],
                )
              ],
            ),

            const SizedBox(height: 18,),

            ProductShowCard(name: name, position: position),

            const SizedBox(height: 35,),

            Column(
              children: [
                SingleChildScrollView(
                  child: Row(
              //scrollDirection: Axis.horizontal,
              // ignore: prefer_const_literals_to_create_immutables - - - - - - - 
              // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      GestureDetector(
                        onTap: () => {prodcutChange("Change name", "Change Position"), },
                        child: const ProductCard(name: "name", position: "position",),
                      )
                      ,
                      FloatingActionButton(
                        onPressed:  () => {
                          prodcutChange("Change name", "Change Position"), 
                          }
                        ),
                      TextButton(
                        style: TextButton.styleFrom(foregroundColor: Colors.yellow),
                        onPressed: () => {prodcutChange("Change name 2", "Change Position 2"), },
                        child: const Text("Clickkk")),
                    ],
                  ),
                ),
              ]
            ),
          ],
        )
      ),
    );
  }
}

