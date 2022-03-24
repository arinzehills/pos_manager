import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pos_manager/auth_screens/forgot_password.dart';
import 'package:pos_manager/constants/constants.dart';
import 'package:pos_manager/manager/bottom_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:form_field_validator/form_field_validator.dart';
import 'package:pos_manager/models/token.dart';
import 'package:pos_manager/services/auth_service.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

final _formKey = GlobalKey<FormState>();
    bool obscureText=true;
    String email='';
    String password='';
    String error='';
    String emailError='';
    String passwordError='';
    late Token token;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Form(
                  key: _formKey,
                  child: Column(                    
                      mainAxisAlignment: MainAxisAlignment.center,
                             children: <Widget>[
                               Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left:30.0, bottom: 8),
                                     child: Text(
                                       'Email Address *',
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
                                           autovalidate: true,
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
                                       
                        Text(
                            emailError,
                            style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                          ),
                                    textAlign:  TextAlign.center,
                              ),   
                                       SizedBox(height: 30),
                                        Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left:30.0, bottom: 8),
                                     child: Text(
                                       'Password *',
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
                          
                               validator:MultiValidator(
                                       
                                          [
                                            RequiredValidator( errorText: 'Please input an email'),
                                             MinLengthValidator(6, errorText: 'Password must be at least 6 character long'),
                                          ]
                                        ),
                                obscureText: obscureText,
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
                                                // obscureText=true;   
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
                    padding: const EdgeInsets.only(top:30.0),
                    child:  Container(
                      width: MediaQuery.of(context).size.width * 0.87,
                      height: 45,
                      child: RaisedButton(
                                    child: Text(
                                      'Login to account',
                                      style: TextStyle(
                                        color: Colors.white,
                                        ),
                                      ),
                                    color: const Color( 0xff2FCA7C),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                    onPressed:()=>{
                                      if(_formKey.currentState!.validate()){
                                        
                                      login()
                                      }
                                      // Navigator.push(context,
                                      // MaterialPageRoute(builder:(context)=>BottomNavigation())
                                      // )
                                    },
                                  ),
                    ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                               Padding(
                                 padding: const EdgeInsets.only(right: 20.0, top: 30),
                                 child: TextButton(
                              onPressed:(){
                                  showDialog(context: context,
                                builder: (BuildContext context){
                                  
                                    return ForgotPassword();
                                  });
                              },
                                 child: Text(
                                   'Forgot Password',
                                   style: TextStyle(
                                     color: myGreen,
                                   ),
                                   )
                                   ),
                               )
                            ],
                          )
                      ]
                  ),
                ),
      ),
      
    );
  }
  Future<void> login() async{
   AuthService authInfo= AuthService();
    try{
       var response =await http.post(
        Uri.parse('https://pmsmanager.herokuapp.com/auth/login/'),
      body: ({
        'email': email,
        'password' : password, 
      }));
          
          Map<dynamic, dynamic> json=jsonDecode(response.body);
          if(json['email'] ==email){
          //  token.token=json['token'];
            print(json['token']);
            AuthService.setToken(json['token']);
            popUp();

          } else{

            List<dynamic>? miniEmailError = json["email"];
          //this checks if the their is no email error response from the back end
          if (miniEmailError!=null) {
            setState(() {
            emailError=miniEmailError[0];
            });
          } else{

               setState(() {
            error = json['message'];      
              emailError='';  
              });
           
            }
             print(json['email']);
             print(json);

          }
           print(json);
         
         
          
            }
            catch(e){
      print(e);
      // setState(() {
      //   error=e.toString();
      // });
    }

     
  }
  
Future popUp(){
    
    return showDialog(
      context: context,
      builder:(context)=>AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        content: Container(
          height: 170,          
          child: Center(
            child: Column(
              children: [
                     Icon(
                          Icons.done_all_rounded,
                            color:  myGreen ,
                            size: 93,
                          ),
                Text(
                  'Successful',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Roboto'
                  ),
                ),
                SizedBox(height: 4),
                RaisedButton(
                                    child: Text(
                                      'Continue' ,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Roboto'
                                        ),
                                      ),
                                    color: const Color( 0xff2FCA7C) ,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                    onPressed:()=>{
                                        Navigator.push(context,
                                      MaterialPageRoute(builder:(context)=>BottomNavigation())
                                      )
                                    },
                                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}