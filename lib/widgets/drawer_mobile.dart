import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';
import 'package:my_portfolio/constants/nav_items.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.scaffoldBg,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: IconButton(
                onPressed: (){
                  Navigator.of(context).pop();
                }, 
                icon: Icon(Icons.close)
              ),
            ),
          ),
          for(int i=0; i<navIcons.length; i++)
          ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
            titleTextStyle: TextStyle(
              color: CustomColor.whitePrimary,
              fontWeight: FontWeight.w600,
              fontSize: 16
            ),
            leading: Icon(navIcons[i]),
            title: Text(navTitle[i]),
          )
        ],
      ),
    );
  }
}