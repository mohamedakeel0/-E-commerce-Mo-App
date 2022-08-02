import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/bloc/cubic/cubic.dart';
import 'package:flutter1/bloc/cubic/states.dart';

import 'package:flutter1/shared/componnents0/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Profile extends StatelessWidget {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();


  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  return   BlocConsumer<ShopCubic, ShopStates>(
        listener: (context, state) {
          if (state is ShopUpdateProfileSuccesState) {
            if (state.UpdateProfileModel.status!) {
              ShowToast(
                  text: state.UpdateProfileModel.message!, state: Toaststates.SUCCESS);

            }}

        }, builder:(context, state){
    var cubic=ShopCubic.get(context);
    nameController.text=cubic.ProfileModel!.data!.name!;
    emailController.text=cubic.ProfileModel!.data!.email!;
    phoneController.text=cubic.ProfileModel!.data!.phone!;
          return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    height: 15,
                  ),
                  if (state is ShopUpdateProfileLoadingState  )
                    LinearProgressIndicator(),
                  Material(  elevation: 10,
                    child: defaultFormField(
                        controller: nameController,
                        type: TextInputType.name,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'please enter your name';
                          }
                        },
                        label: 'Name',
                        prefix: Icons.person),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Material(  elevation: 10,
                    child: defaultFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'please enter your email address';
                          }
                        },
                        label: 'Email Address',
                        prefix: Icons.email_outlined),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Material(  elevation: 10,
                    child: defaultFormField(
                        controller: phoneController,
                        type: TextInputType.phone,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'phone must not be empty';
                          }
                          return null;
                        },
                        label: 'Phone',
                        prefix: Icons.phone),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ConditionalBuilder(
                      condition: true,
                      builder: (context) => defaultButton(shape: false,
                          function: () {
                            if (formkey.currentState!.validate()) {

                              cubic.putUpdateProfile(name: nameController.text, phone: phoneController.text, email: emailController.text);


                            }
                          },
                          text: 'UpDate',
                          isUpperCase: false),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator())),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),)
      );}
    );
  }
}
