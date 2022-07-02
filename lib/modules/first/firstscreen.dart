import 'package:flutter/material.dart';
import 'package:flutter1/modules/Login/Shoplogin.dart';
import 'package:flutter1/modules/Regisiter/register.dart';
import 'package:flutter1/shared/componnents0/components.dart';

class First_screen extends StatelessWidget {
  const First_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: Colors.orangeAccent,height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width ,
      child: Column(mainAxisAlignment:MainAxisAlignment.center,children: [
        CircleAvatar(
          backgroundColor: Colors.orange,
          radius: 115,
          child: CircleAvatar(
            backgroundColor: Colors.orangeAccent[100],
            radius: 110,
            child: CircleAvatar(
              backgroundImage:AssetImage('image/image.png'), //NetworkImage
              radius: 100,
            ), //CircleAvatar
          ), //CircleAvatar
        ),
        SizedBox(height: 10,),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'E -',
                style: TextStyle(
                    fontSize:  32,color: Colors.white,
                    fontWeight: FontWeight.w800)),
            TextSpan(
                text: ' Mo',
                style: TextStyle(
                    fontSize:  32,
                    fontWeight: FontWeight.w800,
                    color: Colors.white))
          ]),
        ),
        SizedBox(height: 15,),
        defaultButton(shape: false,width: 300,Textcolor: Colors.orangeAccent,background: Colors.white,
            function: () {
              navigateTo(context, Shoplogin());

            },
            text: 'Login',isUpperCase: false
            ),
        SizedBox(height: 10,),
        defaultButton(shape: false,width: 300,
            function: () {

              navigateTo(context, shop_register());
            },
            text: 'Register',isUpperCase: false
           ),
      ],) //Center
    ),);
  }
}
