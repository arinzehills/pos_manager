import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:pos_manager/constants/constants.dart';
import 'package:pos_manager/manager/create_record.dart';
import 'package:pos_manager/manager/dasboard.dart';
import 'package:pos_manager/manager/outlet_list.dart';
import 'package:pos_manager/manager/range.dart';
import 'package:pos_manager/manager/record.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({ Key? key }) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  
  List<Widget>? _widgetOptions = [
    Dashboard(),
    Record(),
    OutletList(),
    Range(),
  ];
  
  final PageStorageBucket bucket= PageStorageBucket();
  Widget currentScreen= Dashboard();
  @override
  Widget build(BuildContext context) {
    
   return Scaffold(
          body:PageStorage(
            child:currentScreen,
            bucket: bucket,
            ) ,
           bottomNavigationBar:BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 5,
              child: Container(
                height: 60,              
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(                        
                          minWidth: 20,
                          onPressed: (){
                            setState(() {
                              currentScreen=Dashboard();
                              _selectedIndex=0;
                            });
                           },
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             
                             children: [
                               Icon(
                                 FeatherIcons.grid,
                                 color: _selectedIndex==0 ? myGreen : Colors.grey,
                                
                               ),
                                Padding(                                  
                                 padding: const EdgeInsets.only(top: 3.0),
                                  child: Text(
                                     'Dashboard',
                                     style: TextStyle(
                                       color: _selectedIndex==0 ? myGreen : Colors.grey,
                                     )
                                   ),
                                ),
                               
                             ],
                           ),
                        ),
                        MaterialButton(
                          minWidth: 20,
                          onPressed: (){
                            setState(() {
                              currentScreen=Record();
                              _selectedIndex=1;
                            });
                           },
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Icon(
                                 FeatherIcons.archive,
                                 color: _selectedIndex==1 ? myGreen : Colors.grey,
                               ),
                                Padding(
                                 padding: const EdgeInsets.only(top: 3.0),
                                  child: Text(
                                     'Record',
                                     style: TextStyle(
                                       color: _selectedIndex==1 ? myGreen : Colors.grey,
                                     )
                                   ),
                                ),
                               
                             ],
                           ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 20,
                          onPressed: (){
                            setState(() {
                              currentScreen=OutletList();
                              _selectedIndex=2;
                            });
                           },
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Icon(
                                 FeatherIcons.home,
                                 color: _selectedIndex==2 ? myGreen : Colors.grey,
                               ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text(
                                     'Outlet',
                                     style: TextStyle(
                                       color: _selectedIndex==2 ? myGreen : Colors.grey,
                                     )
                                   ),
                                ),
                               
                             ],
                           ),
                        ),
                        MaterialButton(
                          minWidth: 20,
                          onPressed: (){
                            setState(() {
                              currentScreen=Range();
                              _selectedIndex=3;
                            });
                           },
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Icon(
                                 FeatherIcons.user,
                                 color: _selectedIndex==3 ? myGreen : Colors.grey,
                               ), 
                               Padding(
                                 padding: const EdgeInsets.only(top: 3.0),
                                 child: Text(
                                     'Profile',
                                     style: TextStyle(
                                       color: _selectedIndex==3 ? myGreen : Colors.grey,
                                     )
                                   ),
                               ),
                               
                             ],
                           ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton:  FloatingActionButton(
                            onPressed: () {
                                       Navigator.push(context,
                                            MaterialPageRoute(builder:(context)=>CreateRecord())
                                            );
                                      },
                          child: const Icon(Icons.add),
                           backgroundColor: myGreen,
                                          ),
               
        );
  }
}
