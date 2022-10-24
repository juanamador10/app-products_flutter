import 'package:flutter/material.dart';
import '../helpers/database_helper.dart';
import '../models/product_model.dart';

import 'add_product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "candies";
  String productName="Galletas Solidarias";
  String noImage = "https://dues.com.mx/duesAdmin/assets/web-page/logos/defaultSF.png";
  @override
  Widget build(BuildContext context) {
    const textTitleStyle = TextStyle(fontSize: 18, color: Colors.brown);
    const textTitleBoldStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.brown);
    const textSmallLetterStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.brown);


    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 70),
            Row(
              children: const [
                Icon(Icons.menu, size: 30),
                Spacer(),
                Icon(Icons.shopping_bag, size: 30)
              ]
            ),

            const SizedBox(height: 20),
            const Text("Hello"),
            const Text("What today's taste?", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedCategory = "candies";
                          print(selectedCategory);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(), backgroundColor: Colors.orange,
                        padding: const EdgeInsets.all(10),
                      ),
                      child: const Icon(
                        Icons.breakfast_dining,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    const Text("Candies", style: textSmallLetterStyle,),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedCategory = "fruits";
                          print(selectedCategory);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(), backgroundColor: Colors.orange,
                        padding: const EdgeInsets.all(10),
                      ),
                      child: const Icon(
                        Icons.apple_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    const Text("Fruits", style: textSmallLetterStyle,),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.search,
                  size: 40,
                )
              ],
            ),
            const SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  width: 350,
                  height: 350,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.orange),
                  child: FutureBuilder<List<Product>>(
                    future: DatabaseHelper.instance.getOneProduct(productName),
                    builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
                      if (!snapshot.hasData) {
                        return 
                        Center(
                          child: Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: const Text("Loading...",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20
                              )
                            ),
                          ),
                        );
                      } else {
                        return snapshot.data!.isEmpty ? 
                          Center(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: const Image(image: NetworkImage("https://dues.com.mx/duesAdmin/assets/web-page/logos/defaultSF.png"), height: 200,)),
                                  const Text("No Products",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20
                                    )
                                  ),
                                ],
                              )
                            )
                          )
                        : ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: snapshot.data!.map((product) {
                              return Row(
                                children: [
                                  Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Image(
                                          image: NetworkImage(product.imagepath),
                                          height: 250.0,
                                          width: 180,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ).toList()
                        );
                      }
                    }
                  ),
                ),
              ],
            ),
            //SizedBox(
            //  height: 30,
            //),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FutureBuilder<List<Product>>(
                    future: DatabaseHelper.instance.getProductsCategory(selectedCategory),
                    builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot){
                      print("CONNECTION: ${snapshot.connectionState})");
                      if(!snapshot.hasData){
                        print(snapshot.data);
                        return Center(
                          child: Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: const Text("Loading...",style: TextStyle(
                              fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20
                            )),
                          ),
                        );
                      }else{
                        return snapshot.data!.isEmpty ? 
                        Center(
                          child: Container(
                            child: const Text("No products", 
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20
                              )
                            )
                          )
                        )
                        :SizedBox(
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: snapshot.data!.map((product) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.orange[300]
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState((){
                                        productName=product.title;
                                      });
                                      print(product.category);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(), backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image(image: NetworkImage(product.imagepath), width: 110,)
                                    ),
                                  )
                                ),
                              );
                            },
                          ).toList()),
                        );
                      }
                    }
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddProductScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(), backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(10),
                      side: const BorderSide(width: 3.0, color: Colors.grey)),
                    child: const Icon(
                      Icons.add,
                      color: Colors.grey,
                      size: 30,
                    ),
                  )
                ],
              ),
            )
          ]
        ),
      )
    );
  }
}