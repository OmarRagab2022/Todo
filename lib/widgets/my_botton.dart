import 'package:flutter/material.dart';

class MyBotton extends StatelessWidget {
  final String labal;
  final VoidCallback function;
  final Color color ;
  final double height;
  final double width;
  const MyBotton({Key? key, required this.labal, required this.function,required this.color,required this.height, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(child: Text(labal,style: const TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.italic,
          fontSize: 14
        ),),),
      ),
    );
  }
}