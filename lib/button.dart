import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onTap;
  const Button({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blueGrey[500],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Text(
            'Track Countries',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey[10],
            ),
          ),
        ),
      ),
    );
  }
}
