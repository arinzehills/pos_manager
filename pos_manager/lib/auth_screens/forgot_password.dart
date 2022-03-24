import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:pos_manager/auth_screens/reset_password.dart';
import 'package:pos_manager/constants/constants.dart';
import 'package:pos_manager/constants/my_button.dart';
import 'package:http/http.dart' as http;


 class Constants{
  Constants._();
  static const double padding =20;
  static const double avatarRadius =45;
}

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({ Key? key }) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
final _formKey = GlobalKey<FormState>();

 _emailSuccess(context){
    Navigator.pop(context);
      showDialog(context: context,
                                builder: (BuildContext context){
                                  
                                    return ResetPassword();
                                  });
    }
_emailFailure(context){
      Navigator.pop(context);
}
  String email='';
    String password='';
    String error='';

Future popUp(bool status){
    
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
                             status==true ? Icons.done_all_rounded : Icons.dangerous  ,
                            color: status==true ? Colors.green : Colors.red,
                            size: 93,
                          ),
                Text(
                  status==true ? 'Email Sent Successfully' : 'Email Sent Failed',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Roboto'
                  ),
                ),
                SizedBox(height: 4),
                RaisedButton(
                                    child: Text(
                                      status==true ? 'Continue' : 'Re-enter email',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Roboto'
                                        ),
                                      ),
                                    color: status==true ?const Color( 0xff2FCA7C) : Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                    onPressed:()=>{
                                      status==true ? _emailSuccess(context) : _emailFailure(context)
                                    },
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
    return
        Padding(
          padding: const EdgeInsets.only(top:299.0),
          child: Card(
            color: Colors.transparent,
            child: Container(
                padding: EdgeInsets.only(left:1,top:30, right:1,bottom:20),
                margin: EdgeInsets.only(top:Constants.avatarRadius * 0.1),
                decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                  color: myGrey,                      
                borderRadius: BorderRadius.circular(Constants.padding),
                boxShadow: [
                    BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                    ),
                    ]
              ),
                              child: SingleChildScrollView(
                                child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left : 14.0),
                                      child: Text(
                                        'Forget Password',
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,                                                      
                                              fontFamily: 'Roboto'
                                              ),
                                              
                                              ),
                                    ),
                                      Padding(
                                      padding: const EdgeInsets.only(left : 14.0, top: 12),
                                      child: Text(
                                        'Enter your email address for the verification process.' +
                                        'We will send you an email a four digit code to your email',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                              ),
                                        ),
                                    SizedBox(height: 4,),                                 
                                        SingleChildScrollView(
                                          child: Form(
                                                        key: _formKey,
                                                        child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                                      Padding(
                                                                            padding: const EdgeInsets.only(left : 14.0, top: 12),
                                                                            child: Text(
                                                                      'Email Address *',
                                                                    style: TextStyle(
                                                                      fontSize: 15,
                                                                      fontWeight: FontWeight.w400),
                                                                      ),
                                                                ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 12.0, right: 12),
                                                                  child: TextFormField(
                                                                    validator:MultiValidator(
                                       
                                                                            [
                                                                               EmailValidator(errorText: 'Please enter a valid email'),
                                                                              RequiredValidator( errorText: 'Please input an email'),
                                                                            ]
                                                                          ),
                                                                    decoration:textFieldDecoration.copyWith(                                                                  
                                                                    hintText: 'Enter your email address',
                                                                                      ) ,
                                                                    onChanged: (val) => {email=val},
                                                                        ),
                                                              ),
                                                                    SizedBox(),
                                                              MyButton(
                                                                placeHolder: 'Continue',
                                                                pressed: (){
                                                                   if(_formKey.currentState!.validate()){
                                                                     
                                                                  forgotPassword();
                                                                popUp(true);
                                                                   }
                                                                }
                                                                )  
                                                          ]
                                                        ), 
                                                  ),
                                        ) ,
                                      
                                        
                                                
                                ],
                                                                ),
                              ),
                            
                      ),
          ),
        );


  }
  Future<void> forgotPassword() async{
    try{
       var response =await http.post(
        Uri.parse('https://pmsmanager.herokuapp.com/auth/request-reset-email'),
      body: ({
        'email': email,
      }));
      
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