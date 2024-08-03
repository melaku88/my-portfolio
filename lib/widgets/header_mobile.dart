import 'package:flutter/material.dart';
import 'package:my_portfolio/style/styles.dart';
import 'package:my_portfolio/widgets/site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onTapLogo, this.onTapMenu});
  final VoidCallback? onTapLogo;
  final VoidCallback? onTapMenu;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50.0,
      margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(onTap: onTapLogo),

          Spacer(),

          IconButton(
            onPressed: onTapMenu, 
            icon: Icon(Icons.menu)
          ),
          SizedBox(width: 15.0,),
        ],
      ),
    );
  }
}