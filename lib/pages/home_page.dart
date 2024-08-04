import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';
import 'package:my_portfolio/services/service.dart';
import 'package:my_portfolio/widgets/contact_desktop.dart';
import 'package:my_portfolio/widgets/contact_mobile.dart';
import 'package:my_portfolio/widgets/device_width.dart';
import 'package:my_portfolio/widgets/drawer_mobile.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobile.dart';
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
  bool isInprocess = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  sendMessage() async {
    setState(() {
      isInprocess = true;
    });
    FocusScope.of(context).unfocus();
    try {
      if (nameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          messageController.text.isNotEmpty) {
        await Services.firestore.collection('Clients').add({
          'name': nameController.text.trim(),
          'email': emailController.text.trim(),
          'message': messageController.text.trim(),
        }).then((val) {
          setState(() {
            isInprocess = false;
          });
          nameController.clear();
          emailController.clear();
          messageController.clear();
          Services.snackBarSuccess(context,
              'Thank You!\nYour message is sent successfully!\n you will get a response soon!  ');
        });
      } else {
        setState(() {
          isInprocess = false;
        });
        Services.snackBarError(
            context, 'All fiels are required, please fill and try again!');
      }
    } on FirebaseException catch (e) {
      setState(() {
        isInprocess = false;
      });
      // ignore: use_build_context_synchronously
      Services.snackBarError(context, e.code);
    }
    // Services.sendMessage(context,
    //   nameController.text.trim(),
    //   emailController.text.trim(),
    //   messageController.text.trim()
    // );
  }

  // ------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer:
              constraints.maxWidth >= kMinDesktopWidth ? null : DrawerMobile(),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              //* main section
              constraints.maxWidth >= kMinDesktopWidth
                  ? HeaderDesktop(
                      onTapLogo: () {},
                    )
                  : HeaderMobile(
                      onTapLogo: () {},
                      onTapMenu: () {
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
                    Text(
                      'What I can do',
                      style: TextStyle(
                          color: CustomColor.whitePrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),

                    SizedBox(
                      height: 50.0,
                    ),

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
                    Text(
                      'My Projects',
                      style: TextStyle(
                          color: CustomColor.whitePrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              // *Contact Section
              constraints.maxWidth >= kMinDesktopWidth
                  ? ContactDesktop(
                      nameController: nameController,
                      emailController: emailController,
                      messageController: messageController,
                      onTap: () {
                        sendMessage();
                      },
                      isSending: isInprocess,
                    )
                  : ContactMobile(
                      nameController: nameController,
                      emailController: emailController,
                      messageController: messageController,
                      onTap: () {
                        sendMessage();
                      },
                      isSending: isInprocess,
                    ),
            ],
          ),
        );
      },
    );
  }
}
