import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:pos_manager/constants/constants.dart';


class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
final _formKey = GlobalKey<FormState>();

    bool obscureText=true;
    String full_name='';
    String phone_number='';
    String email='';
    String password='';
    String error='';
    String emailError='';
    String passwordError='';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Form(
                  key: _formKey,
                  autovalidate: true,
                  child: Column(
                    
                      mainAxisAlignment: MainAxisAlignment.center,
                             children: <Widget>[
                               Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left:30.0, bottom: 10, top: 20),
                                     child: Text(
                                       'Full Name *'
                                     ),
                                   )
                                 ],
                               ),
                                       Container(
                                       width: MediaQuery.of(context).size.width * 0.87,
                                         child: TextFormField(
                                validator: (val)=> val!.isEmpty ? 'Please enter your full name' : null,
                                      decoration:textFieldDecoration.copyWith(                                          
                                            hintText: 'Enter your full name',
                                      ) ,
                                          onChanged: (val){
                                              setState(() =>full_name=val);
                                          },
                              ),
                                       ),   
                                       SizedBox(height: 30),
                                        Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left:30.0, bottom: 10),
                                     child: Text(
                                       'Phone Number *'
                                     ),
                                   )
                                 ],
                               ),
                                       Container(
                                       width: MediaQuery.of(context).size.width * 0.87,
                                         child: TextFormField(
                                           
                                     validator: (val)=> val!.isEmpty ? 'Please enter your phone number' : null,
                                      decoration:textFieldDecoration.copyWith(
                                            hintText: 'Enter your phone number',
                                      ) ,
                                          onChanged: (val){
                                              setState(() =>phone_number=val);
                                          },
                              ),
                                       ),  
                                       //for email address 
                                       SizedBox(height: 30), Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left:30.0, bottom: 10),
                                     child: Text(
                                       'Email Address *'
                                     ),
                                   )
                                 ],
                               ),
                                       Container(
                                       width: MediaQuery.of(context).size.width * 0.87,
                                         child: TextFormField(
                                validator: MultiValidator(
                                       
                                          [
                                            RequiredValidator(errorText: 'Please input an email'),
                                             MinLengthValidator(3, errorText: 'Email must be at least 3 letters'),
                                             EmailValidator(errorText: 'Please enter a valid email')
                                          ]
                                        ),
                                      decoration:textFieldDecoration.copyWith(
                                          
                                            hintText: 'Enter your email address',
                                      ) ,
                                          onChanged: (val){
                                              setState(() =>email=val);
                                          },
                              ),
                                       ),   
                                       SizedBox(height: 30),
                                        Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left:30.0, bottom: 10),
                                     child: Text(
                                       'Password *'
                                     ),
                                   )
                                 ],
                               ),
                      Container(
                      width: MediaQuery.of(context).size.width * 0.87,
                        child: TextFormField(
                               validator: MultiValidator(
                                       
                                          [
                                            RequiredValidator(errorText: 'Please password is required'),
                                             MinLengthValidator(6, errorText: 'Password must be at least 6 characters'),
                                          ]
                                        ),
                                obscureText: true,
                                decoration: textFieldDecoration.copyWith( 
                                    prefixIcon: Icon(
                                            Icons.lock,
                                            color: Colors.green,
                                            ),
                                             
                                          suffixIcon: IconButton(
                                                icon: const Icon(Icons.visibility),
                                                color:Colors.green,
                                                onPressed: () {
                                                 if(obscureText==true){
                                                    setState(() {
                                                      obscureText=false;
                                                    });
                                                  }
                                                  else{
                                                    setState(() {
                                                obscureText=true;   
                                                  });
                                                  }
                                                },
                                            ),                             
                                 hintText: 'Enter your password'
                                  ),
                                  cursorColor: Colors.red,
                                   onChanged: (val){
                                                setState(() =>password =val);
                                            },
                          ),
                      ),
                        Text(
                            error,
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
                                      'Create account',
                                      style: TextStyle(
                                        color: Colors.white,
                                        ),
                                      ),
                                    color: const Color( 0xff2FCA7C),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                    onPressed:()=>{
                                       if(_formKey.currentState!.validate()){
                                        register()
                                      }
                                    },
                                  ),
                    ),
                          )
                      ]
                  ),
                ),
      ),
      
    );
  }
    Future<void> register() async{
    try{
        String phoneCode="+234" + phone_number.substring(1);
        print(phoneCode);
       var response =await http.post(
        Uri.parse('https://pmsmanager.herokuapp.com/auth/register/'),
      
      body: ({
        'full_name': full_name,
        'phone_number': phoneCode,
        'email': email,
        'password' : password, 
      }));
      
          Map<dynamic, dynamic> json=jsonDecode(response.body);
          
          // List<dynamic>? miniEmailError = json["email"];
          // //this checks if the their is no email error response from the back end
          // if (miniEmailError!=null) {
          //   setState(() {
          //   emailError=miniEmailError[0];
          //   });
          // } else{
           
          //      setState(() {
          //   error = json['message'];        
          //     });
          //   setState(() {
          //   emailError='';
          //   });
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