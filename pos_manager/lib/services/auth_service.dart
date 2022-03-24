import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;

import 'package:pos_manager/constants/constants.dart';

class AuthService{
  final baseUrl ='https://pmsmanager.herokuapp.com';
  static final SESSION=FlutterSession();
  static setToken(String token) async{
    _AuthData data=_AuthData(token);
    return await SESSION.set('tokens', data);

  }
  static getToken() async{
    return await SESSION.get('token');
  }

  // Future<void> login(email,password) async{
  //   try{
  //      var response =await http.post(
  //       Uri.parse('https://pmsmanager.herokuapp.com/auth/login/'),
  //     body: ({
  //       'email': email,
  //       'password' : password, 
  //     }));
          
  //         Map<dynamic, dynamic> json=jsonDecode(response.body);
  //         if(json['email'] ==email){
  //         //  token.token=json['token'];
  //           print(json['token']);
  //           popUp();
  //         } else{

  //           List<dynamic>? miniEmailError = json["email"];
  //         //this checks if the their is no email error response from the back end
  //         if (miniEmailError!=null) {
  //           setState(() {
  //           emailError=miniEmailError[0];
  //           });
  //         } else{

  //              setState(() {
  //           error = json['message'];      
  //             emailError='';  
  //             });
           
  //           }
  //            print(json['email']);
  //            print(json);

  //         }
  //          print(json);
         
         
          
  //           }
  //           catch(e){
  //     print(e);
  //     // setState(() {
  //     //   error=e.toString();
  //     // });
  //   }

     
  // }
  
}



class _AuthData {
    String token;

    _AuthData(this.token);

    //to jSon
    Map<String, dynamic> toJson(){

   final Map<String, dynamic> data =Map<String, dynamic>();

    data['token']=token;
    return data;
    }
}