import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:pos_manager/constants/constants.dart';
import 'package:pos_manager/constants/my_button.dart';
import 'package:pos_manager/manager/create_outlet.dart';
import 'package:pos_manager/manager/create_range_category.dart';

class Outlet extends StatefulWidget {
  const Outlet({ Key? key }) : super(key: key);

  @override
  _OutletState createState() => _OutletState();
}

class _OutletState extends State<Outlet> {
  bool isLoading=false;

  void _showModalBottomSheet(context){

      showModalBottomSheet(context: context, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
    
      builder: (context){
          return
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Padding(
                      padding: const EdgeInsets.only(left:13.0),
                      child: Text(
                'More Options',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18
                ),
              ),
                    ),
                    IconButton(
            icon: Icon(
               FeatherIcons.x ,
              color:Colors.black ,
              ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
                ],
              ),
             Row(
               children: [
                 IconButton(
                    icon: Icon(
                          FeatherIcons.edit2 ,
                          color:Colors.black ,
                          size: 19.83,
                          ),
                    tooltip: 'edit',
                    onPressed: () {
                  _showModalBottomSheet(context);
                   },
               ),
                Padding(
                      padding: const EdgeInsets.only(left:13.0),
                      child: Text(
                          'Edit Outlet',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                          ),
                        ),
                    ),
               ],
             ),

            ]
          );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme:IconThemeData(
            color: Colors.black,
            
          ),
          backgroundColor: Colors.white,
        title: Text(
          'Outlet',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
            fontSize: 18,
            color: Colors.black
          ),
          ),
          actions: [
            
              IconButton(
            icon: Icon(
               FeatherIcons.moreVertical ,
              color:Colors.black ,
              ),
            tooltip: 'Show Snackbar',
            onPressed: () {
              _showModalBottomSheet(context);
            },
          ),
          ]
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
          child: Column(
            children: <Widget>[
                  Container(
                    height: 147,
                    width: MediaQuery.of(context).size.width* 0.9,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      child: Padding(
                        padding: const EdgeInsets.only(top:20.67,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [ 
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom:20.67, left: 130,right: 16),
                                        child: Icon(
                                          FeatherIcons.home ,
                                          color:myGrey,
                                          size: 60,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom:57.67,top: 0),
                                        child: Icon(
                                          FeatherIcons.moreVertical ,
                                          color:Colors.black,
                                          size: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                     Padding(
                                       padding: const EdgeInsets.only(bottom: 14.0),
                                       child: Text(
                                        'Bosso Phase 1',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Roboto',
                                          fontSize: 18,
                                          color: Colors.black
                                        ),
                                    ),
                                     ),
                               
                          ],
                        ),
                      ),
                      ),
                  ),
                  Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                    child: ListTile(
                          title: Text(
                              'Address',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: myGrey
                              ),
                            ),
                          subtitle: Text(
                              'NO 2, Tundu Fulani, Bosso',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                color: Colors.black
                              ),
                            ),
                       ),
                    ),
                  Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                    child: ListTile(
                          title: Text(
                              'Officer',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: myGrey
                              ),
                            ),
                          subtitle: Text(
                              'John Smith',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                color: Colors.black
                              ),
                            ),
                             trailing: Icon(
                                          FeatherIcons.chevronRight,
                                          color: myGrey,
                                          ),
                       ),
                    ),
                  Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                    child: ListTile(
                          title: Text(
                              'Range Category',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: myGrey
                              ),
                            ),
                          subtitle: Text(
                              'Minna Category',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                color: Colors.black
                              ),
                            ),
                       ),
                    ),
                  Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                    child: ListTile(
                          title: Text(
                              'Create Date',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: myGrey
                              ),
                            ),
                          subtitle: Text(
                              'August 13, 2021',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                color: Colors.black
                              ),
                            ),
                       ),
                    ),
                    MyButton(placeHolder: 'View Logs', pressed: (){
                       Navigator.push(context,
                                      MaterialPageRoute(builder:(context)=>CreateRangeCategory())
                                      );
                    })
            ],
          ),
        )
      );
      
  }
}