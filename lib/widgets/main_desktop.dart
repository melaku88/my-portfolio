import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';

class MainDesktop extends StatefulWidget {
  const MainDesktop({super.key});

  @override
  State<MainDesktop> createState() => _MainDesktopState();
}

class _MainDesktopState extends State<MainDesktop> {
    var btnBackground = Colors.black.withOpacity(0);

   double profileAvatar = 100.0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return   Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: screenSize.height/1.25,
      constraints: BoxConstraints(
        minHeight: 350.0
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hellow,',
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('I\'m',
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 10.0,),
                  Text('Melaku Belew',
                  style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              Text('A Flutter Developer',
              style: TextStyle(
                fontSize: 20.0, 
                fontWeight: FontWeight.w600,
                color: CustomColor.yellowSecondary,
                ),
              ),
              SizedBox(height: 15.0,),

              SizedBox(
                width: 300.0,
                child: OutlinedButton(
                  onPressed: (){
                
                  },
                  onHover: (value) {
                    if(value){
                      setState(() {
                        btnBackground = Colors.black.withOpacity(0.8);
                      });
                    }else{
                      setState(() {
                        btnBackground = Colors.black.withOpacity(0);
                      });
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: btnBackground,
                    padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0)
                  ),
                  child: Text(
                    'Get in touch',
                    style: TextStyle(
                      color: CustomColor.whiteSecondary,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
              )
            ],
          ),

          SizedBox(width: screenWidth*0.1,),

          OutlinedButton(
            onPressed: (){},
            onHover: (value) {
              if(value){
                  setState(() {
                    profileAvatar = 110.0;
                  });
                }else{
                  setState(() {
                    profileAvatar = 100.0;
                  });
              }
            },
            style: OutlinedButton.styleFrom(
              shape: CircleBorder(),
              side: BorderSide(color: Colors.transparent)
            ),
            child: CircleAvatar(
              radius: profileAvatar,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  'images/myself.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}