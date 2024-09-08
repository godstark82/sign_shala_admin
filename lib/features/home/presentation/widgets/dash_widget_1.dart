import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardWidget1 extends StatelessWidget {
  final String heading;
  final int data;
  final String desc;
  final double value;
  final Color valueColor;
  const DashBoardWidget1({
    super.key,
    this.value = 0.75,
    this.valueColor = Colors.deepPurple,
    required this.data,
    required this.desc,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      width: context.width > 750 ? context.width * 0.195 : context.width,
      color: Colors.white,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(heading,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text(
            data.toString(),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          LinearProgressIndicator(value: value,color: valueColor,),
          Text(desc)
        ],
      ),
    );
  }
}
