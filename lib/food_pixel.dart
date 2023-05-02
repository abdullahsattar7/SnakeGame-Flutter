
import 'package:flutter/material.dart';

class FoodPixel extends StatelessWidget {
  const FoodPixel({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.yellowAccent,
              Colors.lightGreenAccent
            ],
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Icon(Icons.fastfood_sharp),
      ),
    );
  }
}
