import 'package:flutter/material.dart';
import 'package:pos_manager/constants/constants.dart';
import 'package:pos_manager/constants/my_button.dart';


 class Constants{
  Constants._();
  static const double padding =20;
  static const double avatarRadius =45;
}

class ResetPassword extends StatefulWidget {
  const ResetPassword({ Key? key }) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
final _formKey = GlobalKey<FormState>();

 _emailSuccess(context){

}
_emailFailure(context){
      
}
Future popUp(bool status){
    
    return showDialog(
      context: context,
      builder:(context)=>AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        content: Container(
          height: 220,          
          child: Center(
            child: Column(
              children: [
                     Icon(
                             status==true ? Icons.done_all_rounded : Icons.dangerous  ,
                            color: status==true ?  myGreen: danger,
                            size: 50,
                          ),
                          SizedBox(height: 20,),
                Text(
                  status==true ? 'Password reset Successfully' : 'Pin incorrect',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 37,),
                Container(
                  height: 45,
                  child: RaisedButton(
                                      child: Text(
                                        status==true ? 'Continue' : 'Re-enter email',
                                        style: TextStyle(
                                          color: Colors.white,
                                          ),
                                        ),
                                      color: status==true ? myGreen: danger, 
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(23)),
                                      onPressed:()=>{},
                                    ),
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
                                                'Reset Password',
                                                    style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                                            ),
                                             Padding(
                                              padding: const EdgeInsets.only(left : 14.0, top: 12),
                                              child: Text(
                                                'Enter the four digits pin that you recieved on your email',
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
                                                                           SizedBox(height: 15,),
                                                                     Padding(
                                                                       padding: const EdgeInsets.only(left: 12.0, right: 12),
                                                                       child: Container(
                                                                         height: 48,
                                                                         child: TextFormField(
                                                                           validator: (val)=> val!.isEmpty ? 'Enter pick up location' : null,
                                                                           decoration:textFieldDecoration.copyWith(
                                                                            
                                                                           hintText: 'Enter your email address',
                                                                                              ) ,
                                                                           onChanged: (val) => {},
                                                            ),
                                                                       ),
                                                                     ),
                                                                           SizedBox(),
                                                                   MyButton(
                                                                     placeHolder: 'Continue',
                                                                      pressed: (){
                                                                        popUp(false);
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
}