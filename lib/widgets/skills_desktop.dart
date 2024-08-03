import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';
import 'package:my_portfolio/constants/skills.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // platforms
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 400.0
          ),
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              for(int i=0; i<platformItems.length; i++)
              Container(
                width: 270,
                decoration: BoxDecoration(
                  color: CustomColor.bgLight1,
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  leading: Image.asset(platformItems[i]['img'], width: 26, height: 26,),
                  title: Text(platformItems[i]['title'],
                    style: TextStyle(
                      fontSize: 14.0
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

        SizedBox(width: 50.0,),

        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 500
            ),
            child: Wrap(
              spacing: 10.0,
              runSpacing: 5.0,
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
            ),
          ),
        )
      ],
    );
  }
}