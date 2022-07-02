import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/layout/cubic/cubic.dart';
import 'package:flutter1/layout/cubic/states.dart';
import 'package:flutter1/shared/componnents0/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController CityController = TextEditingController();


    TextEditingController RegionController = TextEditingController();

    TextEditingController DetailsController = TextEditingController();
    TextEditingController NotesController = TextEditingController();
    return   BlocConsumer<ShopCubic, ShopStates>(
        listener: (context, state) {


        }, builder:(context, state){
      var cubic=ShopCubic.get(context);

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
                            label: 'Name',prefix: Icons.person
                           ),
                      ),
                      SizedBox(
                        height: 15,
                      ),Material(  elevation: 10,
                        child: defaultFormField(
                            controller: CityController,
                            type: TextInputType.name,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'please enter your name';
                              }
                            },
                            label: 'City',prefix: Icons.location_city
                            ),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      Material(  elevation: 10,
                        child: defaultFormField(
                            controller: RegionController,
                            type: TextInputType.name,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'please enter your name';
                              }
                            },
                            label: 'Region',prefix: Icons.app_registration
                           ),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      Material(  elevation: 10,
                        child: defaultFormField(
                            controller: DetailsController,
                            type: TextInputType.name,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'please enter your name';
                              }
                            },
                            label: 'Details', prefix: Icons.details
                            ),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      Material(  elevation: 10,
                        child: defaultFormField(
                            controller: NotesController,
                            type: TextInputType.name,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'please enter your name';
                              }
                            },
                            label: 'Notes',
                            prefix: Icons.note),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ConditionalBuilder(
                          condition: true,
                          builder: (context) => defaultButton(shape: false,
                              function: () {
                                if (formkey.currentState!.validate()) {




                                }
                              },
                              text: 'Save Adress',
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
