import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';
import 'package:my_portfolio/constants/skills.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // platforms
        for(int i=0; i<platformItems.length; i++)
        Container(
          margin: EdgeInsets.only(bottom: 5.0),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: CustomColor.bgLight1,
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Image.asset(platformItems[i]['img'], width: 26, height: 26,),
            title: Text(platformItems[i]['title'],
              style: TextStyle(
                fontSize: 14.0
              ),
            ),
          ),
        ),

        SizedBox(height: 50.0,),

        Wrap(
          spacing: 10.0,
          runSpacing: 5.0,
          alignment: WrapAlignment.start,
          children: [
            for(int i=0; i<skillItems.length; i++)
            Chip(
              backgroundColor: CustomColor.scaffoldBg,
              side: BorderSide(color: CustomColor.scaffoldBg),
              padding: EdgeInsets.all(10.0),
              label: Text(skillItems[i]['title']),
              avatar: Image.asset(skillItems[i]['img']),
            ),
          ],
        )
      ],
    );
  }
}