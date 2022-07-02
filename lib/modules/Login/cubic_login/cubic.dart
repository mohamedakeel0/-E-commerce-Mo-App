

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter1/modules/Login/cubic_login/states.dart';
import 'package:flutter1/shared/network/End_point.dart';
import 'package:flutter1/shared/network/remot/dio_helper.dart';

import 'package:flutter1/models/modelLogin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoploginCubic extends Cubit<ShopLoginStates>{
  ShoploginCubic() : super(ShopLoginInitailState());
  static ShoploginCubic get(context) => BlocProvider.of(context);
ShopLoginModel? loginModel;
void userLogin({required email,required password
}){
emit(ShopLoginILoadingState());
DioHelper.postdata(url: LOGIN, data: {
'email':email,
  'password':password

},).then((value) {
  print(value.data);
  loginModel=ShopLoginModel.fromJson(value.data);

  emit(ShopLoginSuccessState(loginModel!));
}).catchError((error){
emit(ShopLoginErrorState(error.toString()));
});
}
  IconData suffix= Icons.visibility_outlined;
  bool isPassword=true;
  void changePasswordvisibility(){
    isPassword=!isPassword;
    suffix= isPassword?Icons.visibility_outlined:Icons.visibility_off;
    emit( ShopChangePasswordVisibilityState());
  }

}