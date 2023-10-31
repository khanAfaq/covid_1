import 'package:flutter/material.dart';

class Reusable extends StatelessWidget {
  final String title, value;
  const Reusable({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[10],
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[10],
              ),
            ),
          ],
        )
      ],
    );
  }
}
