import 'package:flutter/material.dart';

class FoodPixel extends StatefulWidget {
  @override
  _AnimatedFoodState createState() => _AnimatedFoodState();
}

class _AnimatedFoodState extends State<FoodPixel>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _animation =
        Tween<double>(begin: 1.0, end: 1.2).animate(_animationController);
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ScaleTransition(
        scale: _animation,
        child: Image.asset(
          'assets/food.png',
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
