import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/bloc/cubic/cubic.dart';
import 'package:flutter1/bloc/cubic/states.dart';


import 'package:flutter1/shared/componnents0/Constants.dart';
import 'package:flutter1/shared/componnents0/components.dart';
import 'package:flutter1/shared/style/colors.dart';
import 'package:flutter1/view/Search/login.dart';
import 'package:flutter1/view/viewpage/Location.dart';
import 'package:flutter1/view/viewpage/Notification.dart';
import 'package:flutter1/view/viewpage/Profile.dart';
import 'package:flutter1/view/viewpage/Settings.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
class ShopLayout extends StatelessWidget {
  GlobalKey _bottomNavigationKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubic,ShopStates>(
      listener: (context,state){




    if (state is ShoplogoutSuccesState) {

    if (state.logoutModel.status!) {

      ShowToast(
          text: state.logoutModel.message!, state: Toaststates.SUCCESS);
      signOut(context);
    }else {
      ShowToast(
          text: state.logoutModel.message!, state: Toaststates.ERROR);
    }
    }
      },
      builder: (context,state){

        var cubic=ShopCubic.get(context);

        return ConditionalBuilder(condition:cubic.ProfileModel != null &&cubic.ProfileModel!.data!=null &&state is! ShopProfileLoadingState && cubic.homeModel!=null &&cubic.homeModel!.data!.products!=null, builder: (context) {

          return  Scaffold(
            appBar: AppBar(
              title: Text('E -  Mo',style: TextStyle(color: Colors.orangeAccent,
                  fontSize:  32,
                  fontWeight: FontWeight.w800,
                  ),),centerTitle: true,
              actions: [IconButton(onPressed: (){
                navigateAndFinish(context, Login());
              }, icon: Icon(Icons.search,color: Colors.black87)),
                Padding(
                  padding: const EdgeInsets.only(right: 12,left: 5),
                  child: Icon(Icons.shopping_cart_outlined,color: Colors.black87,),
                ),
              ],
            ),
            body:cubic.bottomScreens[cubic.CurrentIndex] ,
            bottomNavigationBar: CurvedNavigationBar(
              key: _bottomNavigationKey,
              index: cubic.CurrentIndex,
              height: 60.0,
              items: <Widget>[
                Icon(Icons.home, size: 30,color:cubic.CurrentIndex==0? Colors.white:Colors.black),
                Icon(Icons.apps, size: 30,color:cubic.CurrentIndex==1? Colors.white:Colors.black),
                Icon(Icons.favorite, size: 30,color:cubic.CurrentIndex==2? Colors.white:Colors.black),


              ],

              buttonBackgroundColor: Colors.orangeAccent,
              backgroundColor: Colors.orangeAccent,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 500),
              onTap: (index) {
                cubic.ChangeBottom(index);

              },
              letIndexChange: (index) => true,
            ),
            drawer: Drawer(
              elevation: 8.0,
              child: ListView(
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.orange,
                          radius: 65,
                          child: CircleAvatar(
                            backgroundColor: Colors.orangeAccent[100],
                            radius: 60,
                            child: CircleAvatar(
                              backgroundImage:AssetImage('image/image.png'), //NetworkImage
                              radius: 50,
                            ), //CircleAvatar
                          ), //CircleAvatar
                        ),
                        SizedBox(height: 10,),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'E -',
                                style: TextStyle(
                                    fontSize:  32,color: Colors.orangeAccent,
                                    fontWeight: FontWeight.w800)),
                            TextSpan(
                                text: ' Mo',
                                style: TextStyle(
                                    fontSize:  32,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.orangeAccent))
                          ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          cubic.ProfileModel!.data!.name!,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          cubic.ProfileModel!.data!.email!,
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: 250,

                  ),
                  ListTile(
                    onTap: (){
                      cubic.ChangePage(0);
                      viewpage(cubic.CurrentPage);
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => Profile()));
                    },
                    title: Text('profile',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    leading: Icon(
                      Icons.person,
                      color: cubic.CurrentPage==0?defaultcolor:Colors.black,
                    ),
                  ),
                  ListTile(
                    onTap: (){
                      cubic.ChangePage(1);
                      viewpage(cubic.CurrentPage);
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => Notification_Screen()));
                    },
                    title: Text('Order',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    leading: Icon(
                      Icons.shopping_cart_outlined,
                      color: cubic.CurrentPage==1?defaultcolor:Colors.black,
                    ),
                  ),
                  ListTile(
                    onTap: (){
                      cubic.ChangePage(2);
                      viewpage(cubic.CurrentPage);
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => Location()));
                    },
                    title: Text('Location',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    leading: Icon(
                      Icons.location_on,
                      color: cubic.CurrentPage==2?defaultcolor:Colors.black,
                    ),
                  ),
                  Divider(color: Colors.black38,),
                  ListTile(
                    onTap: (){
                      cubic.ChangePage(3);
                      viewpage(cubic.CurrentPage);
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => Settings_screen()));
                    },
                    title: Text('settings',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    leading: Icon(
                      Icons.settings,
                      color: cubic.CurrentPage==3?defaultcolor:Colors.black,
                    ),
                  ),
                  ListTile(
                    onTap: (){
                      cubic.ChangePage(4);
                      String SomeFcmToken='SomeFcmToken';
                      cubic.postlogout(SomeFcmToken);


                    },
                    title: Text('logout',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    leading: Icon(
                      Icons.logout,
                      color: cubic.CurrentPage==4?defaultcolor:Colors.black,
                    ),
                  ),


                ],
              ),
            ),
          );
        }, fallback: (context) => Center(
          child: CircularProgressIndicator(),
        ));


      },
    );
  }
  Widget viewpage(int page){
    switch(page) {
      case 0:
        return Profile();
      case 1:
        return Notification_Screen();
      case 2:
        return Location();
      case 3:
        return Settings_screen();


    } return Container(color: Colors.red,);
  }
}

