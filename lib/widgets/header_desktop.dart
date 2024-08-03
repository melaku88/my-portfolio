import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';
import 'package:my_portfolio/constants/nav_items.dart';
import 'package:my_portfolio/style/styles.dart';
import 'package:my_portfolio/widgets/site_logo.dart';

class HeaderDesktop extends StatelessWidget {
  final VoidCallback? onTapLogo;
  const HeaderDesktop({super.key, this.onTapLogo});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 60,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: kHeaderDecoration,
      child: Row(
        children: [

          SiteLogo(
            onTap: onTapLogo,
          ),

          Spacer(),

          for(int i = 0; i<navTitle.length; i++)
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: TextButton(
              onPressed: (){}, 
              child: Text(
                navTitle[i],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.whitePrimary
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}