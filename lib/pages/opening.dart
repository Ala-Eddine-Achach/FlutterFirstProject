import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Opening extends StatefulWidget {
  const Opening({super.key});

  @override
  State<Opening> createState() => _OpeningState();
}

class _OpeningState extends State<Opening> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(child: RiveAnimation.asset(
        "assests/money.riv",
      )),
    );
  }
}
