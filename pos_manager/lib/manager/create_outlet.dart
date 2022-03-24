import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:pos_manager/constants/constants.dart';


class CreateOutlet extends StatefulWidget {
  const CreateOutlet({ Key? key }) : super(key: key);

  @override
  _CreateOutletState createState() => _CreateOutletState();
}

class _CreateOutletState extends State<CreateOutlet> {
final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme:IconThemeData(
            color: Colors.black,
            
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Create Outlet',
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
          ]
        ),
        body: SingleChildScrollView(
        child: Form(
                  key: _formKey,
                  child: Column(
                    
                      mainAxisAlignment: MainAxisAlignment.center,
                             children: <Widget>[
                               Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left:30.0, bottom: 10, top: 21),
                                     child: Text(
                                       'Outlet Name *',
                                       style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                                       Container(
                                         height: 48,
                                       width: MediaQuery.of(context).size.width * 0.87,
                                         child: TextFormField(
                                validator: (val)=> val!.length < 6 ? 'Enter your outlet name here' : null,
                                      decoration:textFieldDecoration.copyWith(
                                          
                                            hintText: 'Enter your outlet name here',
                                      ) ,
                                          onChanged: (val){
                                              // setState(() =>password=val);
                                          },
                              ),
                                       ),   
                                       SizedBox(height: 30),
                                        Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left:30.0, bottom: 10),
                                     child: Text(
                                       'Outlet Address *',
                                       style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                                       Container(
                                         height: 48,
                                       width: MediaQuery.of(context).size.width * 0.87,
                                         child: TextFormField(
                                validator: (val)=> val!.length < 6 ? 'Enter your outlet address here' : null,
                                      decoration:textFieldDecoration.copyWith(
                                          
                                            hintText: 'Enter your outlet address here',
                                      ) ,
                                          onChanged: (val){
                                              // setState(() =>password=val);
                                          },
                              ),
                                       ),   
                                       SizedBox(height: 30), Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left:30.0, bottom: 10),
                                     child: Text(
                                       'Select Officer',
                                       style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                                       Container(
                                         height: 48,
                                       width: MediaQuery.of(context).size.width * 0.87,
                                         child: TextFormField(
                                validator: (val)=> val!.length < 6 ? 'Select officer' : null,
                                      decoration:textFieldDecoration.copyWith(
                                           suffixIcon: IconButton(
                                                icon: const Icon(Icons.expand_more),
                                                color:myGrey,
                                                onPressed: () {                                             
                                                  
                                                },
                                            ), 
                                            hintText: 'Select Officer',
                                      ) ,
                                          onChanged: (val){
                                              // setState(() =>password=val);
                                          },
                              ),
                                       ),   
                                       SizedBox(height: 30),
                                        Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left:30.0, bottom: 10),
                                     child: Text(
                                       'Select Range Category',
                                       style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                      Container(
                      width: MediaQuery.of(context).size.width * 0.87,
                      height: 48,
                        child: TextFormField(
                               validator: (val)=> val!.isEmpty ? 'Enter your range'
                                                                   : null,
                                obscureText: true,
                                decoration: textFieldDecoration.copyWith(                                             
                                          suffixIcon: IconButton(
                                                icon: const Icon(Icons.expand_more),
                                                color:myGrey,
                                                onPressed: () {
                                                
                                                  
                                                },
                                            ),                             
                                 hintText: 'Select Range'
                                  ),
                                  cursorColor: Colors.red,
                                   onChanged: (val){
                                                // setState(() =>matNumber =val);
                                            },
                          ),
                      ),
                        Text(
                            'error',
                            style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                          ),
                                    textAlign:  TextAlign.center,
                              ),
                    Padding(
                    padding: const EdgeInsets.all(28.0),
                    child:  Container(
                      width: MediaQuery.of(context).size.width * 0.87,
                      height: 45,
                      child: RaisedButton(
                                    child: Text(
                                      'Create outlet',
                                      style: TextStyle(
                                        color: Colors.white,
                                        ),
                                      ),
                                    color: const Color( 0xff2FCA7C),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                    onPressed:()=>{},
                                  ),
                    ),
                          )
                      ]
                  ),
                ),
      ),
    );
  }
}