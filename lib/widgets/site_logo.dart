import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';

class SiteLogo extends StatelessWidget {
  final VoidCallback? onTap;
  const SiteLogo({super.key, this.onTap});

  final Color backgroundColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap, 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('MB',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: CustomColor.yellowSecondary
            ),
          ),
          Container(
            width: 30.0,
            height: 1.5,
            color: CustomColor.yellowSecondary,
          )
        ],
      ),
    );
  }
}