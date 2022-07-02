

import 'package:flutter1/models/modelLogin.dart';

abstract class ShopLoginStates{}
class ShopLoginInitailState extends ShopLoginStates{}
class ShopLoginILoadingState extends ShopLoginStates{}
class ShopLoginSuccessState extends ShopLoginStates{
  final ShopLoginModel loginModel;

  ShopLoginSuccessState(this.loginModel);

}
class ShopLoginErrorState extends ShopLoginStates{
  final String error;
  ShopLoginErrorState(this.error);
}
class ShopChangePasswordVisibilityState extends ShopLoginStates{}