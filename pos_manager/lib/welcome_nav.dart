import 'package:flutter/material.dart';
import 'package:pos_manager/auth_screens/login.dart';
import 'package:pos_manager/auth_screens/register.dart';

class WelcomeNavigation extends StatefulWidget {
  const WelcomeNavigation({ Key? key }) : super(key: key);

  @override
  _WelcomeNavigationState createState() => _WelcomeNavigationState();
}

class _WelcomeNavigationState extends State<WelcomeNavigation> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      // The number of tabs / content sections to display.
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
         appBar: AppBar(
           toolbarHeight: MediaQuery.of(context).size.height* 0.25,
           backgroundColor:const Color(0xffE5E5E5) ,
            bottom: const TabBar(
              labelColor: const Color( 0xff2FCA7C),
              indicatorColor:const Color( 0xff2FCA7C) ,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  text:'Log In' ,                  
                    ),
                Tab(
                   text:'Sign Up' ,
                ),
              ],
            ),
            title: Column(
              children: [
                Center(
                  child:  Container(
  
                padding: EdgeInsets.all(20.0),
  
                  child:
  
                  Image.asset('assets/logo.png')
  
              ),
                  ),
              ],
            ),
            
          ),
          body: const TabBarView(
            children: [
              Login(),
              Register(),
            ],
          ),
      ), // Complete this code in the next step.
      );
    

  }
}