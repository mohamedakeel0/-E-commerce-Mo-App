import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/bloc/cubic_regisiter/cubic.dart';
import 'package:flutter1/bloc/cubic_regisiter/states.dart';


import 'package:flutter1/shared/componnents0/Constants.dart';
import 'package:flutter1/shared/componnents0/components.dart';
import 'package:flutter1/shared/network/local/cache_helper.dart';
import 'package:flutter1/view/HomeApp/HomeApp.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

class shop_register extends StatelessWidget {
  const shop_register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController PasswordController1 = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return BlocProvider(create: (context) => ShopRegisterCubic(),
      child: BlocConsumer<ShopRegisterCubic, ShopRegisterStates>(
          listener: (context, state) {

            if (state is ShopRegisterSuccessState) {
              if (state.loginModel.status!) {
                print(state.loginModel.message);
                print(state.loginModel.data!.email);

                CacheHelper.saveData(
                    key: 'token', value: state.loginModel.data!.token)
                    .then((value) {token=state.loginModel.data!.token;navigateAndFinish(context, ShopLayout());});
                ShowToast(
                    text: state.loginModel.message!, state: Toaststates.SUCCESS);
              } else {
                ShowToast(
                    text: state.loginModel.message!, state: Toaststates.ERROR);
              }
            }
          }, builder:(context, state) =>  Scaffold(
        appBar:PreferredSize(
            preferredSize: Size.fromHeight(200.0),
            child: Container(child: Padding(
              padding: const EdgeInsets.only(left: 20,top: 100),
              child: Column( crossAxisAlignment: CrossAxisAlignment.start,children: [
                Text(
                  'Register',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.white),
                ),
                Text(
                  'Register now to brower our hot offers',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.grey[600]),
                ),
              ],),
            ),
              decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: new BorderRadius.vertical(
                      bottom: Radius.elliptical(150, 30)
                  )),)),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(
                      height: 15,
                    ),
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
                            if(value==null || !EmailValidator.validate(value)){
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
                          isPassword: ShopRegisterCubic.get(context).isPassword,

                          controller: passwordController,
                          suffix: ShopRegisterCubic.get(context).suffix,
                          suffixPressed: () {
                            ShopRegisterCubic.get(context).changePasswordvisibility();
                          },
                          type: TextInputType.visiblePassword,
                          validate: (value) {
                            if (value!.isEmpty &&PasswordController1.text!=passwordController.text
                            ) {
                              return 'Invalid password!';
                            }else if(value.length<8&&PasswordController1.text!=value){
                              return 'Password too short!';
                            }
                          },
                          label: 'password',
                          prefix: Icons.lock_outline),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Material(  elevation: 10,
                      child: defaultFormField(
                          isPassword: ShopRegisterCubic.get(context).isPassword,

                          controller: PasswordController1,
                          suffix: ShopRegisterCubic.get(context).suffix,
                          suffixPressed: () {
                            ShopRegisterCubic.get(context).changePasswordvisibility();
                          },
                          type: TextInputType.visiblePassword,
                          validate: (value) {
                            if (value!.isEmpty &&PasswordController1.text!=passwordController.text
                            ) {
                              return 'Invalid password!';
                            }else if(value.length<8&&PasswordController1.text!=passwordController.text){
                              return 'Password too short!';
                            }
                          },
                          label: 'password',
                          prefix: Icons.lock_outline),
                    ),
                    SizedBox(
                      height: 30,
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
                        condition: state is! ShopRegisterILoadingState,
                        builder: (context) => defaultButton(shape: false,
                            function: () {
                              if (formkey.currentState!.validate()) {
                                print(passwordController.text);
                                ShopRegisterCubic.get(context).userRegister(name: nameController.text,phone: phoneController.text,email:emailController.text ,password: passwordController.text);

                              }
                            },
                            text: 'Register',
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
          ),
        ),
      )),);
  }
}
