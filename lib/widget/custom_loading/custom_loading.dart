import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoading extends StatefulWidget {
  const CustomLoading({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomLoading> createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 196, 217, 235).withOpacity(0.2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: SpinKitFadingFour(
          size: 30,
          color: Colors.white,
          controller: controller,
        ),
      ),
    );
  }
}
