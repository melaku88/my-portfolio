import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';
import 'package:my_portfolio/widgets/custom_textfield.dart';
import 'package:my_portfolio/widgets/message_field.dart';

class ContactDesktop extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController messageController;
  final VoidCallback onTap;
  final bool isSending;
  const ContactDesktop(
      {super.key,
      required this.nameController,
      required this.emailController,
      required this.messageController,
      required this.onTap, required this.isSending});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      width: screenWidth,
      color: Colors.black12,
      padding: EdgeInsets.fromLTRB(30, 38, 30, 60),
      child: Column(
        children: [
          // title
          Text(
            'Get in touch',
            style: TextStyle(
                color: CustomColor.whitePrimary,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),

          SizedBox(
            height: 30.0,
          ),

          Row(
            children: [
              Flexible(
                  child: MyTextField(
                      controller: nameController,
                      hintText: 'Your name',
                      maxLine: 1)),
              SizedBox(
                width: 15.0,
              ),
              Flexible(
                  child: MyTextField(
                      controller: emailController,
                      hintText: 'Your email',
                      maxLine: 1))
            ],
          ),
          SizedBox(
            height: 35.0,
          ),
          MyMessageField(controller: messageController),

          SizedBox(
            height: 30.0,
          ),

          OutlinedButton(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 15, 124, 174)),
              child: isSending
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      'Send Message',
                      style: TextStyle(color: Colors.white),
                    )),

          SizedBox(
            height: 50.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'images/github.png',
                    height: 30,
                    width: 30.0,
                  )),
              SizedBox(
                width: 15,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'images/telegram.png',
                    height: 30,
                    width: 30.0,
                  )),
              SizedBox(
                width: 15,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'images/facebook.png',
                    height: 30,
                    width: 30.0,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
