import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:pos_manager/constants/constants.dart';
import 'package:pos_manager/manager/range_category_list.dart';
import 'package:http/http.dart' as http;


class CreateRangeCategory extends StatefulWidget {
  const CreateRangeCategory({ Key? key }) : super(key: key);

  @override
  _CreateRangeCategoryState createState() => _CreateRangeCategoryState();
}

class _CreateRangeCategoryState extends State<CreateRangeCategory> {
final _formKey = GlobalKey<FormState>();

  String name='';
  String description='';
  String range_type='';
 String dropdownValue = 'Select you charge type';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme:IconThemeData(
            color: Colors.black,
            
          ),
          backgroundColor: Colors.white,
        title: Text(
          'Create Range Category',
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
                                     padding: const EdgeInsets.only(left:30.0, bottom: 8, top: 21),
                                     child: Text(
                                       'Range Type *',
                                       style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),
                                   )
                                 ],
                               ),    
                                   rangeList(),
                              Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left:30.0, bottom: 8, top: 21),
                                     child: Text(
                                       'Name *',
                                       style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                                       Container(
                                       width: MediaQuery.of(context).size.width * 0.87,
                                       height:  46,
                                         child: TextFormField(
                                validator: (val)=> val!.length < 6 ? 'Enter a valid password' : null,
                                        
                                      decoration:textFieldDecoration.copyWith(
                                          
                                            hintText: 'Enter your email address',
                                      ) ,
                                          onChanged: (val){
                                              // setState(() =>password=val);
                                          },
                              ),
                                       ),   
                                         Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left:30.0, bottom: 8, top: 21),
                                     child: Text(
                                       'Description *',
                                       style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                                       Container(
                                       width: MediaQuery.of(context).size.width * 0.87,
                                         child: TextFormField(
                                              validator: (val)=> val!.length < 6 ? 'Enter Description *' : null,
                                              keyboardType: TextInputType.multiline,                                              
                                              maxLines: 6,  
                                                                                          
                                              decoration:InputDecoration(
                                                            fillColor: Colors.white,
                                                            hintText: 'Enter here',
                                                            hintStyle: TextStyle(
                                                                        fontSize: 14,
                                                                        ),
                                                            border:OutlineInputBorder(
                                                                borderSide: BorderSide(color: Colors.grey),
                                                                
                                                                borderRadius: BorderRadius.circular(23.0),
                                                            ), 
                                                               
                                                          ),
                                          onChanged: (val){
                                              // setState(() =>password=val);
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
                          padding: const EdgeInsets.only(top:30.0),
                          child:  Container(
                              width: MediaQuery.of(context).size.width * 0.87,
                              height: 45,
                              child: RaisedButton(
                                    child: Text(
                                      'Create Category',
                                      style: TextStyle(
                                        color: Colors.white,
                                        ),
                                      ),
                                    color: const Color( 0xff2FCA7C),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                    onPressed:()=>{
                                      // Navigator.push(context,
                                      // MaterialPageRoute(builder:(context)=>RangeCategoryList())
                                      // )
                                       createRange()
                                    },
                                  ),
                    ),
                          ),
                          
                      ]
                  ),
                ),
      ),
      
    );
  }
    List<String> categorylist=[
      'customer fee for withdrawal',
      ' pos fee for withdrawal',
      'pos fee for transfer'
    ];
  Widget rangeList() {
     return Padding(
       padding: const EdgeInsets.all(18.0),
       child: Container(
         padding: EdgeInsets.only(left: 25,right: 25),
         decoration: BoxDecoration(
           border: Border.all(color: Colors.grey, width: 1),
           borderRadius: BorderRadius.circular(25)
         ),
         child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(
            Icons.expand_more,
            color: Colors.grey,
            ),
          iconSize: 24,
          elevation: 16,
          isExpanded: true,
          style: const TextStyle(color: Colors.grey),
          underline: SizedBox(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Select you charge type', 'customer fee for withdrawal', 'pos fee for withdrawal',
                 'pos fee for transfer']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
    ),
       ),
     );
   }
  
  Future<void> createRange() async{
    try{
       var response =await http.post(
        Uri.parse('https://pmsmanager.herokuapp.com/range/category/'),
        body: ({
          'name': name,
          'description': description,
          'range_type': range_type,
        }),
          headers: {
    HttpHeaders.authorizationHeader: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjMyNDgwNzk4LCJqdGkiOiI1ZGE2ZDM5YTk2Mjk0ZDFlOWNmNGYxODRmNDhhOTYwNCIsInVzZXJfaWQiOjJ9.8SrjDx0VjLgiQxDY0bYBKJerD_jtDFj4MdNnjBwTsDM',
  },
        );
      
          Map<dynamic, dynamic> json=jsonDecode(response.body);
          // if(json['email'] ==email){
          //   popUp();
          // } else{

          //   List<dynamic>? miniEmailError = json["email"];
          // //this checks if the their is no email error response from the back end
          // if (miniEmailError!=null) {
          //   setState(() {
          //   emailError=miniEmailError[0];
          //   });
          // } else{

          //      setState(() {
          //   error = json['message'];      
          //     emailError='';  
          //     });
           
          //   }
          //    print(json['email']);
          //    print(json);

          // }
           print(json);
         
         
          
            }
            catch(e){
      print(e);
      // setState(() {
      //   error=e.toString();
      // });
    }

     
  }
}