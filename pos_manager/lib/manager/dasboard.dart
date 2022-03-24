import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:pos_manager/constants/constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Dashboard',
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
        body: SingleChildScrollView(
          child: Column(
            children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top:16.0),
                    child: Container(
                        height: 147,
                        width: MediaQuery.of(context).size.width* 0.9,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: const Color(0xff5D5FEF),
                          child: Padding(
                            padding: const EdgeInsets.only(top:20.67,),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [ 
                                        Padding(
                                             padding: const EdgeInsets.only(top: 30.0,bottom: 20),
                                             child: Text(
                                              'Today’s Capital',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Roboto',
                                                fontSize: 18,
                                                color: Colors.white
                                              ),
                                          ),
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.only(bottom: 14.0),
                                             child: Text(
                                              '#500,000',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Roboto',
                                                fontSize: 18,
                                                color: Colors.white
                                              ),
                                          ),
                                           ),
                                     
                                ],
                              ),
                            ),
                          ),
                          ),
                      ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     Container(
                          height: 140,
                          width: MediaQuery.of(context).size.width* 0.4,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: myGreen,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20.67,),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [ 
                                          Padding(
                                               padding: const EdgeInsets.only(top: 30.0,bottom: 20),
                                               child: Text(
                                                'Last Profit',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                  color: Colors.white
                                                ),
                                            ),
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.only(bottom: 19.0),
                                               child: Text(
                                                '#5,000',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                  color: Colors.white
                                                ),
                                            ),
                                             ),
                                       
                                  ],
                                ),
                              ),
                            ),
                            ),
                        ),
                        Container(
                          height: 140,
                          width: MediaQuery.of(context).size.width* 0.4,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: danger,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20.67,),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [ 
                                          Padding(
                                               padding: const EdgeInsets.only(top: 30.0,bottom: 19),
                                               child: Text(
                                                'Last Expense',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                  color: Colors.white
                                                ),
                                            ),
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.only(bottom: 19.0),
                                               child: Text(
                                                '#20,000',
                                                softWrap: false,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                  color: Colors.white
                                                ),
                                            ),
                                             ),
                                       
                                  ],
                                ),
                              ),
                            ),
                            ),
                        ),
                    ],
                  ),
                ),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     Container(
                          height: 140,
                          width: MediaQuery.of(context).size.width* 0.4,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            child: Padding(
                              padding: const EdgeInsets.only(top:20.67,),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [ 
                                          Padding(
                                               padding: const EdgeInsets.only(top: 30.0,bottom: 20),
                                               child: Text(
                                                'Total Outlet',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                  color: Colors.black
                                                ),
                                            ),
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.only(bottom: 19.0),
                                               child: Text(
                                                '10',
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
                        ),
                        Container(
                          height: 140,
                          width: MediaQuery.of(context).size.width* 0.4,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            child: Padding(
                              padding: const EdgeInsets.only(top:20.67,),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [ 
                                          Padding(
                                               padding: const EdgeInsets.only(top: 30.0,bottom: 19),
                                               child: Text(
                                                'Total Officers',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                  color: Colors.black
                                                ),
                                            ),
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.only(bottom: 19.0),
                                               child: Text(
                                                '10',
                                                softWrap: false,
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
                        ),
                    ],
                  ),
            ],
          ),
        ),
    );
  }
}