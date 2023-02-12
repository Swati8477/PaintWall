import 'package:flutter/material.dart';
import 'package:PaintWall/classes/language_constants.dart';

class ProductPage extends StatelessWidget{
  const ProductPage({Key? key}) : super(key: key);


  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Products"),
        title: Text(translation(context).products),// yha pe products aana chaiye that will fix later
      ),
    );
  }
}