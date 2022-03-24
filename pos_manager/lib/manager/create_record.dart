import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:pos_manager/constants/constants.dart';
import 'package:pos_manager/constants/my_button.dart';
import 'package:pos_manager/manager/dasboard.dart';


class CreateRecord extends StatefulWidget {
  const CreateRecord({ Key? key }) : super(key: key);

  @override
  _CreateRecordState createState() => _CreateRecordState();
}

class _CreateRecordState extends State<CreateRecord> {
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
          'Create Record',
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
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                    Padding(
                                     padding: const EdgeInsets.only(left:30.0, bottom: 10, top: 21),
                                     child: Text(
                                       'Today’s Capital',
                                       style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                         fontSize: 18
                                       ),
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only( bottom: 10, top: 21,right: 22),
                                     child: Text(
                                       '#500,000',
                                       style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                         fontSize: 18,
                                         color: myGreen
                                       ),
                                     ),
                                   )
                                 ],
                               ),
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
                               validator: (val)=> val!.isEmpty ? 'Enter your Record'
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
                        placeHolder: 'Create Record',
                         pressed: (){
                           
                            Navigator.push(context,
                                      MaterialPageRoute(builder:(context)=>Dashboard())
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