import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:pos_manager/constants/constants.dart';
import 'package:pos_manager/constants/my_button.dart';
import 'package:pos_manager/manager/create_range.dart';


class RangeCategory extends StatefulWidget {
  const RangeCategory({ Key? key }) : super(key: key);

  @override
  _RangeCategoryState createState() => _RangeCategoryState();
}

class _RangeCategoryState extends State<RangeCategory> {
 
 
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
                          'Edit Range',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                          ),
                        ),
                    ),
               ],
             ),
              Row(
               children: [
                 IconButton(
                    icon: Icon(
                          FeatherIcons.trash2 ,
                          color:danger ,
                          size: 19.83,
                          ),
                    tooltip: 'edit',
                    onPressed: () {
                        popUp();
                   },
               ),
                Padding(
                      padding: const EdgeInsets.only(left:13.0),
                      child: Text(
                          'Delete Range',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: danger,
                          ),
                        ),
                    ),
               ],
             ),
            ]
          );
      });
  }

  
Future popUp(){
    
    return showDialog(
      context: context,
      builder:(context)=>AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        content: Container(
          height: 172,          
          child: Center(
            child: Column(
              children: [
                Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.red,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: const Icon(FeatherIcons.trash2),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom:17.0,top: 9),
                      child: Text(
                  'Confirm Delete?',
                  
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold
                  ),
                ),
                    ),
                Padding(
                  padding: const EdgeInsets.only(bottom:15.0),
                  child: Text(
                    'Are you sure you want to delete?',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Roboto'
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 45,
                      child: RaisedButton(
                                          child: Text(
                                             'No',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Roboto'
                                              ),
                                            ),
                                          color: myGreen,                                          
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(23)),
                                          onPressed:()=>{
                                            // status==true ? _emailSuccess(context) : _emailFailure(context)
                                          },
                                        ),
                    ),
                    Container(
                      height: 45,
                      child: RaisedButton(
                                          child: Text(
                                             'Yes',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Roboto'
                                              ),
                                            ),
                                          color: danger,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(23)),
                                          onPressed:()=>{
                                            // status==true ? _emailSuccess(context) : _emailFailure(context)
                                          },
                                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
          'Range Category',
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
                    height: 184,
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
                                          FeatherIcons.briefcase,
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
                                       padding: const EdgeInsets.only(bottom: 18.0),
                                       child: Text(
                                        'General Range',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Roboto',
                                          fontSize: 18,
                                          color: Colors.black
                                        ),
                                    ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(bottom: 14.0, left: 10,right: 10, top: 0),
                                       child: Text(
                                        'This range is for all the general POS in Rivers, Imo, '
                                         'Abia Kano and Kaduna',
                                         softWrap: false,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Roboto',
                                          fontSize: 10,
                                          color: Colors.black,
                                          
                                        ),
                                    ),
                                     ),
                               
                          ],
                        ),
                      ),
                      ),
                  ),
                
                    MyButton(placeHolder: 'View Range', pressed: (){
                       Navigator.push(context,
                                      MaterialPageRoute(builder:(context)=>CreateRange())
                                      );
                    })
            ],
          ),
        )
      );
      
  }
}