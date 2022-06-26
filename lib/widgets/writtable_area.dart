import 'package:flutter/material.dart';

class WrittableArea extends StatelessWidget {
  const WrittableArea({
    Key? key,
    required this.computingText,
    required this.textColor,
    required this.resultsText,
  }) : super(key: key);

  final String computingText;
  final Color? textColor;
  final String resultsText;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Text(
              computingText,
              style: TextStyle(color: textColor, fontSize: 30),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Text(
              resultsText,
              style: TextStyle(
                  color: textColor, fontSize: 60, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
