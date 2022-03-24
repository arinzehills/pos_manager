import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:pos_manager/constants/constants.dart';
import 'package:pos_manager/constants/my_button.dart';
import 'package:pos_manager/manager/range_list.dart';


class CreateRange extends StatefulWidget {
  const CreateRange({ Key? key }) : super(key: key);

  @override
  _CreateRangeState createState() => _CreateRangeState();
}

class _CreateRangeState extends State<CreateRange> {
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
          'Create Range',
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
                                       'Minimum Value *',
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
                                          
                                            hintText: 'Enter your minimum value here',
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
                                       'Maximum Value *',
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
                                          
                                            hintText: 'Enter your maximum here',
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
                                       'Select Charge Type',
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
                                            hintText: 'Select you charge type',
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
                                       'Charge Amount *',
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
                                 hintText: 'Enter your charge amount here'
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
                    child: MyButton(
                        placeHolder: 'Create Range',
                         pressed: (){
                           
                            Navigator.push(context,
                                      MaterialPageRoute(builder:(context)=>RangeList())
                                      );
                         })
                    ),
                      ]
                  ),
                ),
      ),
    );
  }
}