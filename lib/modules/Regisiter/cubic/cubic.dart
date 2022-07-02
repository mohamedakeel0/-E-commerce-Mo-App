import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter1/modules/Regisiter/cubic/states.dart';
import 'package:flutter1/shared/network/End_point.dart';
import 'package:flutter1/shared/network/remot/dio_helper.dart';

import 'package:flutter1/models/modelLogin.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ShopRegisterCubic extends Cubit<ShopRegisterStates> {
  ShopRegisterCubic() : super(ShopRegisterInitailState());

  static ShopRegisterCubic get(context) => BlocProvider.of(context);
  ShopLoginModel? loginModel;

  void userRegister(
      { required name,required phone,required email, required password }) {
    emit(ShopRegisterILoadingState());
    DioHelper.postdata(
      url: REGISTER,
      data: {'name': name,
        'phone': phone, 'email': email,'password': password,

      },
    ).then((value) {
      print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);

      emit(ShopRegisterSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordvisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off;
    emit(ShopRegisterChangePasswordVisibilityState());
  }
}
