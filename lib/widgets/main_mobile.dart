import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';

class MainMobile extends StatefulWidget {
  const MainMobile({super.key});

  @override
  State<MainMobile> createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile> {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return   Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      width: screenWidth,
      height: screenSize.height/1.35,
      constraints: BoxConstraints(
        minHeight: 400.0
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          CircleAvatar(
            radius: 70.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.asset(
                'images/myself.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 50.0,),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hellow,',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
              ),

              Row(
                children: [
                  Text('I\'m',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 10.0,),
                  Text('Melaku Belew',
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Text('A Flutter Developer',
              style: TextStyle(
                fontSize: 22.0, 
                fontWeight: FontWeight.w600,
                color: CustomColor.yellowSecondary,
                ),
              ),
              SizedBox(height: 15.0,),

              SizedBox(
                width: 200.0,
                child: OutlinedButton(
                  onPressed: (){
                
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 16.0)
                  ),
                  child: Text(
                    'Get in touch',
                    style: TextStyle(
                      color: CustomColor.whiteSecondary,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}