import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String position;

  const ProductCard(
      {Key? key,
      required this.name,
      required this.position,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const fontStyle1 = TextStyle(
      fontWeight: FontWeight.bold,
    );
    const fontStyle2 = TextStyle(
        fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 12);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(150)),
      elevation: 25,
      child: const CircleAvatar(
        radius: 40.0,
        backgroundImage:
            NetworkImage('https://cdn.dsmcdn.com/ty158/product/media/images/20210809/12/117071800/224878258/1/1_org_zoom.jpg'),
        backgroundColor: Colors.transparent,
      )
    );
  }
}

