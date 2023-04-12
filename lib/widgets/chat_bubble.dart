import 'package:flutter/material.dart';

class ReceiverMessageBubble extends StatelessWidget {
  const ReceiverMessageBubble({
    Key? key,
    required this.size,
    required this.message,
    required this.name,
    required this.date,
  }) : super(key: key);
  final Size size;
  final String message;
  final String name;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Stack(
        children: <Widget>[
          Container(
            width: size.width * 0.6,
            margin: EdgeInsets.only(
                top: size.height * 0.0075,
                left: size.width * 0.01,
                bottom: size.height * 0.022),
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.015, vertical: size.height * 0.008),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(6)),
            child: Text(
              '$date',
              style:
                  TextStyle(color: Colors.grey, fontSize: size.height * 0.012),
            ),
          )
        ],
      ),
    );
  }
}
