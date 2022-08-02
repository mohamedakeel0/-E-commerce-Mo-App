
import 'dart:io';

import 'package:bloc/bloc.dart';


import 'package:flutter/material.dart';

import 'package:flutter1/bloc/cubic/states.dart';
import 'package:flutter1/models/ChangeFavorites.dart';
import 'package:flutter1/models/FavoritesModel.dart';
import 'package:flutter1/models/LogoutModel.dart';
import 'package:flutter1/models/ModelCategories.dart';
import 'package:flutter1/models/Modelcarts.dart';
import 'package:flutter1/models/modelLogin.dart';



import 'package:flutter1/shared/componnents0/Constants.dart';
import 'package:flutter1/shared/network/End_point.dart';
import 'package:flutter1/shared/network/remot/dio_helper.dart';
import 'package:flutter1/view/Categories/Categories_screen.dart';
import 'package:flutter1/view/Favorits/Favorits_screen.dart';
import 'package:flutter1/view/HomeApp/modelHome.dart';
import 'package:flutter1/view/Products/Products_Screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


class ShopCubic extends Cubit<ShopStates> {
  ShopCubic() : super(ShopInitailState());

  static ShopCubic get(context) => BlocProvider.of(context);
  int CurrentIndex = 0;
  List<Widget> bottomScreens = [

    Products_Screen(),
    Categories_screen(),
    Favorits_screen(),

  ];

  void ChangeBottom(int index) {
    CurrentIndex = index;
    emit(ShopChangeBottomNavState());
  }
  int CurrentPage = 0;
  void ChangePage(int index) {
    CurrentPage = index;
    emit(ShopCurrentPageNavState());
  }

  bool isSwitched = false;
  void ChangeSwitch(bool value) {
    isSwitched = value;
    emit(ChangeSwitchState());
  }
  HomeModel?homeModel;
  Map<int,bool> favorites={};
  void getDataHome(){
    emit(ShopLoadingHomeDataState());

     DioHelper.getdata(url: HOME,token: token).then((value) {
       print('sdsadsdsd');
      print(value.data);
      homeModel=HomeModel.fromJson(value.data);
homeModel!.data!.products!.forEach((element) {
  favorites.addAll({element.id!:element.inFavorites!,});
});print(favorites.toString());
      emit(ShopSuccessHomeDataState());
    }).catchError((error){

      emit(ShopErrorHomeDataState(error.toString()));
    });
  }
  ModelCategories?modelCategories;
  void getCategories(){
    emit(ShopLoadingCategoriesState());

    DioHelper.getdata(url: CATEGORIES,token: token).then((value) {
      print('sdsadsdsd');

      modelCategories=ModelCategories.fromJson(value.data);
      print(value.data);
      emit(ShopSuccesCategoriesState(modelCategories!));
    }).catchError((error){

      emit(ShopErrorCategoriesState(error.toString()));
    });
  }
  ChangeFavoritesModel?changeFavoritesModel;
  void postChangeFavorites(int product_id){
    favorites[product_id] = !favorites[product_id]!;
    emit(ChangeFavoritesState());

    DioHelper.postdata(url: FAVORITES, token: token,data: {
      "product_id":product_id
    }).then((value) {


      changeFavoritesModel=ChangeFavoritesModel.fromJson(value.data);
      print(value.data);
      if(!changeFavoritesModel!.status!){
        favorites[product_id] = !favorites[product_id]!;
      }else{
        getFavorites();
      }
      emit(ChangeFavoritesSuccesState(changeFavoritesModel!));
    }).catchError((error){
      favorites[product_id] = !favorites[product_id]!;
      emit(ChangeFavoritesErrorState(error.toString()));
    });
  }
  FavoritesModel?favoritesModel;
  void getFavorites(){
    emit(ShopFavoritesLoadingState());

    DioHelper.getdata(url: FAVORITES,token: token).then((value) {


      favoritesModel=FavoritesModel.fromJson(value.data);
      print(value.data);
      emit(ShopFavoritesSuccesState(favoritesModel!));
    }).catchError((error){

      emit(ShopFavoritesErrorState(error.toString()));
    });
  }
  ShopLoginModel? ProfileModel;
  void getProfile(){
    emit(ShopProfileLoadingState());

    DioHelper.getdata(url: PROFILE,token: token).then((value) {


      ProfileModel=ShopLoginModel.fromJson(value.data);
      print('Profile 00000000000');
      print(value.data);
      emit(ShopProfileSuccesState(ProfileModel!));
    }).catchError((error){

      emit(ShopProfileErrorState(error.toString()));
    });
  }
  ShopLoginModel? UpdateProfileModel;
  void putUpdateProfile( { required name,required phone,required email }){
    emit(ShopUpdateProfileLoadingState());

    DioHelper.putdata(url: UPDATAPROFILE,token: token,data:{'name': name,
      'phone': phone, 'email': email,

    }, ).then((value) {


      UpdateProfileModel=ShopLoginModel.fromJson(value.data);

      emit(ShopUpdateProfileSuccesState(UpdateProfileModel!));
      getProfile();
    }).catchError((error){

      emit(ShopUpdateProfileErrorState(error.toString()));
    });
  }

  LogoutModel?logoutModel;
  void postlogout(String  SomeFcmToken){

    emit(ShoplogoutLoadingState());

    DioHelper.postdata(url: LOGOUT, token: token,data: {
      "fcm_token": SomeFcmToken,
    }).then((value) {


      logoutModel=LogoutModel.fromJson(value.data);

      emit(ShoplogoutSuccesState(logoutModel!));
    }).catchError((error){

      emit(ShoplogoutErrorState(error.toString()));
    });
  }

  Modelcarts? modelcarts;
  void postCarts(int product_id){

    emit(ShoplpostCartsLoadingState());

    DioHelper.postdata(url: CARTS, token: token,data: {
      "product_id": product_id,
    }).then((value) {


      modelcarts=Modelcarts.fromJson(value.data);

      emit(ShoppostCartsSuccesState(modelcarts!));
    }).catchError((error){

      emit(ShoppostCartsErrorState(error.toString()));
    });
  }

}