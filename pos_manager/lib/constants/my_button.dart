import 'package:flutter/material.dart';
import 'package:pos_manager/constants/constants.dart';


class MyButton extends StatelessWidget {
  String placeHolder;
  final Function pressed;
  
  MyButton({
    required this.placeHolder, required this.pressed,
  });
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
                              child: SizedBox(
                                width: double.infinity,
                                height: 45.0,
                                child:RaisedButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                  onPressed:(){
                                     pressed();
                                    },
                                  color: myGreen,
                                  child: Text(
                                    placeHolder,
                                      style:TextStyle(
                                        color:Colors.white,
                                      ),

                                  ),
                                ),

                                ),
    );
  }
}