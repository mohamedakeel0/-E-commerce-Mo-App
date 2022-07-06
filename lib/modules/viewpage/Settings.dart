import 'package:flutter/material.dart';
import 'package:flutter1/layout/cubic/cubic.dart';
import 'package:flutter1/layout/cubic/states.dart';
import 'package:flutter1/modules/Login/cubic_login/states.dart';
import 'package:flutter1/shared/componnents0/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings_screen extends StatelessWidget {
  const Settings_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubic, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'Settings',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87),
              ),
              centerTitle: true,
            ),
            body: Column(children: [
              builditemsettings('Night Mode', Icons.nights_stay_outlined, Icons.wb_sunny,'mode',true,false,context),Padding(
                padding: const EdgeInsets.only(right: 20),
                child: myDivider(),
              ),
              builditemsettings('Country', Icons.import_contacts_rounded, Icons.arrow_forward_ios,'Egypt',false,true,context),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: myDivider(),
              ),
              builditemsettings('Language', Icons.language, Icons.arrow_forward_ios,'English',false,true,context),
            ],));
      },
    );
  }
}
Widget builditemsettings(text1,icon1,icon2,text2,Switch0,booltext2,context)=>Padding(
  padding: const EdgeInsets.only(top: 10),
  child: Center(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            TextButton(
                onPressed: () {},
                child: Icon(icon1)),
            SizedBox(
              width: 10,
            ),
            Text(
              text1,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Spacer(),
            booltext2==true? Text(
              text2,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ):
            SizedBox(
              width: 10,
            ),
         Switch0==false?   TextButton(
                onPressed: () {},
                child: Icon(icon2)):
            Switch(
              value: ShopCubic.get(context).isSwitched,
              onChanged: (value){
                ShopCubic.get(context).ChangeSwitch(value);
              },

              activeTrackColor: Colors.orange,
              activeColor: Colors.orangeAccent,
            ),
          ],
        ),
      ),
    ),
  ),
);