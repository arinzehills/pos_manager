import 'package:flutter/material.dart';

      const  appId="0282cdbc-0b53-4f12-b9c9-4762e3ebedc2";
      final iconsColor=Color(int.parse("0xffffffff"));
      final myGreen=Color(int.parse("0xff2FCA7C"));
      final myGrey=Color(int.parse("0xffE5E5E5"));
      final danger=Color(int.parse("0xffD43A3A"));


    var textFieldDecoration = InputDecoration(
                              
                                  
                                 hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                     ),
                                  filled: true,
                                  fillColor:  Colors.white,                        
                                  focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                
                                  borderRadius: BorderRadius.circular(50.0),
                                 ),
                                 border:OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                
                                  borderRadius: BorderRadius.circular(50.0),
                                 ), 
                                 errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  
                                  borderRadius: BorderRadius.circular(50.0),
                                 ), 
);