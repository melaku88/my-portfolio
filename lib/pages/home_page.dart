import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';
import 'package:my_portfolio/widgets/custom_textfield.dart';
import 'package:my_portfolio/widgets/device_width.dart';
import 'package:my_portfolio/widgets/drawer_mobile.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobile.dart';
import 'package:my_portfolio/widgets/message_field.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ------------------------------------------------------------
   final scaffoldKey = GlobalKey<ScaffoldState>();
   final TextEditingController nameController = TextEditingController();
   final TextEditingController emailController = TextEditingController();
   final TextEditingController messageController = TextEditingController();
  // ------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return LayoutBuilder(builder:(context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColor.scaffoldBg,
      
        endDrawer: constraints.maxWidth >= kMinDesktopWidth ? null : DrawerMobile(),
      
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            //* main section
            constraints.maxWidth >= kMinDesktopWidth
            ? HeaderDesktop(
              onTapLogo: () {},
            )
            : HeaderMobile(
              onTapLogo: (){},
              onTapMenu: (){
                scaffoldKey.currentState?.openEndDrawer();
              },
            ),

           constraints.maxWidth >= kMinDesktopWidth 
           ? MainDesktop() 
           : MainMobile(),

          //* Skills Section
          Container(
            width: screenWidth,
            color: Colors.black12,
            padding: EdgeInsets.fromLTRB(20, 38, 20, 60),
            child: Column(
              children: [
                // title
                Text('What I can do',
                  style: TextStyle(
                    color: CustomColor.whitePrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(height: 50.0,),

                // platforms and skills
                constraints.maxWidth >= kMinDesktopWidth 
                ? SkillsDesktop() 
                : SkillsMobile(),


              ],
            ),
          ),

          //* project section
          Container(
            height: 300.0,
            width: screenWidth,
            padding: EdgeInsets.fromLTRB(20, 38, 20, 60),
            child: Column(
              children: [
                // title
                Text('My Projects',
                  style: TextStyle(
                    color: CustomColor.whitePrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),

          // *Contact Section
          Container(
            width: screenWidth,
            color: Colors.black12,
            padding: EdgeInsets.fromLTRB(30, 38, 30, 60),
            child: Column(
              children: [
                // title
                Text('Get in touch',
                  style: TextStyle(
                    color: CustomColor.whitePrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
                
                SizedBox(height: 30.0,),

                Row(
                  children: [
                    Flexible(
                      child: MyTextField(
                        controller: nameController, 
                        hintText: 'Your name', 
                        maxLine: 1
                      )
                    ),
                    SizedBox(width: 15.0,),
                    Flexible(
                      child: MyTextField(
                        controller: emailController, 
                        hintText: 'Your email', 
                        maxLine: 1
                      )
                    )
                  ],
                ),
                SizedBox(height: 35.0,),
                MyMessageField(controller: messageController),

                SizedBox(height: 50.0,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   OutlinedButton(
                    onPressed: (){},
                    style: OutlinedButton.styleFrom(
                      shape: CircleBorder(),
                    ), 
                    child: Image.asset('images/github.png', height: 30, width: 30.0,)
                  ),
           

                  OutlinedButton(
                    onPressed: (){},
                    style: OutlinedButton.styleFrom(
                      shape: CircleBorder(),
                    ), 
                    child: Image.asset('images/telegram.png', height: 30, width: 30.0,)
                  ),
                 

                  OutlinedButton(
                    onPressed: (){},
                    style: OutlinedButton.styleFrom(
                      shape: CircleBorder(),
                    ), 
                    child: Image.asset('images/facebook.png', height: 30, width: 30.0,)
                  )
                  ],
                )
              ],
            ),
          ),
      
          //* footer section
          Container(
            height: 100,
            width: double.maxFinite,
            color:CustomColor.scaffoldBg
          ),
          ],
        ),
      );
    },
    );
  }
}