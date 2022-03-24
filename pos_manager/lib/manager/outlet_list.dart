import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:pos_manager/constants/constants.dart';
import 'package:pos_manager/manager/create_outlet.dart';

import 'outlet.dart';

class OutletList extends StatefulWidget {
  const OutletList({ Key? key }) : super(key: key);

  @override
  _OutletListState createState() => _OutletListState();
}

class _OutletListState extends State<OutletList> {
  bool isLoading=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Outlet List',
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
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
          ],
        ),
        body: isLoading
              ? Center(child: CircularProgressIndicator())
              // :students.isEmpty
              //     ? Text(
              //         'No Notes',
              //         style: TextStyle(color: Colors.white, fontSize: 24),
              //       )
                  : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(0,1,8,0),
              itemCount: 5, //documents.length,
              itemBuilder: (BuildContext context, int index) {
                 
              return Container(
                height: 80,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Card(
                      
                      child:ListTile(
                                title: SizedBox(
                                  width: 50,
                                  child: Wrap(
                                               children: [
                                                Text( 'Bosso phase1' ,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Text('data')
                                ),
                                contentPadding: EdgeInsets.fromLTRB(-7,5,3, 5),
                                leading: Padding(
                                  padding: const EdgeInsets.only(left: 13.0),
                                  child: Icon(
                                                FeatherIcons.home,
                                                color:myGrey,
                                                ),
                                ),
                                trailing: Icon(
                                              FeatherIcons.chevronRight,
                                              color: myGrey,
                                              ),
                                onTap:() => {
                                   Navigator.push(context,
                                      MaterialPageRoute(builder:(context)=>Outlet())
                                      )
                                }
                                ),
                              ),
              );
                    },
            separatorBuilder: (BuildContext context, int index) => const Divider(height: 1,),
                ),
                  ),
            floatingActionButton: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(context,
                                      MaterialPageRoute(builder:(context)=>CreateOutlet())
                                      );
                      },
                    child: const Icon(Icons.add),
                     backgroundColor: myGreen,
    ),
      );
      
  }
}