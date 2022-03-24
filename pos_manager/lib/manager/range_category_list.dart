import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:pos_manager/constants/constants.dart';
import 'package:pos_manager/manager/range_category.dart';

class RangeCategoryList extends StatefulWidget {
  const RangeCategoryList({ Key? key }) : super(key: key);

  @override
  _RangeCategoryListState createState() => _RangeCategoryListState();
}

class _RangeCategoryListState extends State<RangeCategoryList> {

  bool isLoading=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Range Category List',
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
                height: 70,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Card(
                      
                      child:ListTile(
                                title: SizedBox(
                                  width: 50,
                                  child: Wrap(
                                               children: [
                                                Text( 'General Range' ,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                  ),
                                ),
                                contentPadding: EdgeInsets.fromLTRB(-7,5,3, 5),
                                leading: Padding(
                                  padding: const EdgeInsets.only(left: 13.0),
                                  child: Icon(
                                                FeatherIcons.briefcase,
                                                color:myGrey,
                                                ),
                                ),
                                trailing: Icon(
                                              FeatherIcons.chevronRight,
                                              color: myGrey,
                                              ),
                                onTap:() => {
                                  //  Navigator.push(context,
                                  //     MaterialPageRoute(builder:(context)=>Outlet())
                                  //     )
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
                                      MaterialPageRoute(builder:(context)=>RangeCategory())
                                      );
                      },
                    child: const Icon(Icons.add),
                     backgroundColor: myGreen,
    ),
      );
      
  }
}