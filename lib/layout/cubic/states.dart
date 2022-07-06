import 'package:flutter1/layout/HomeApp/modelHome.dart';
import 'package:flutter1/models/ChangeFavorites.dart';
import 'package:flutter1/models/FavoritesModel.dart';
import 'package:flutter1/models/LogoutModel.dart';
import 'package:flutter1/models/ModelCategories.dart';
import 'package:flutter1/models/Modelcarts.dart';
import 'package:flutter1/models/modelLogin.dart';

abstract class ShopStates{}
class ShopInitailState extends ShopStates{}
class ShopChangeBottomNavState extends ShopStates{}
class ShopCurrentPageNavState extends ShopStates{}
class ChangeSwitchState extends ShopStates{}
class ShopLoadingHomeDataState extends ShopStates{}
class ShopSuccessHomeDataState extends ShopStates{

}
class   ShopErrorHomeDataState extends ShopStates{
  final String error;
  ShopErrorHomeDataState(this.error);
}
class ShopLoadingCategoriesState extends ShopStates{}
class ShopSuccesCategoriesState extends ShopStates{
  final ModelCategories modelCategories;

  ShopSuccesCategoriesState(this.modelCategories);
}
class   ShopErrorCategoriesState extends ShopStates{
  final String error;
  ShopErrorCategoriesState(this.error);
}
class ChangeFavoritesState extends ShopStates{}
class ChangeFavoritesSuccesState extends ShopStates{
  final ChangeFavoritesModel changeFavoritesModel;

  ChangeFavoritesSuccesState(this.changeFavoritesModel);
}
class  ChangeFavoritesErrorState extends ShopStates{
  final String error;
  ChangeFavoritesErrorState(this.error);
}
class ShopFavoritesLoadingState extends ShopStates{}
class  ShopFavoritesSuccesState extends ShopStates{
  final FavoritesModel favoritesModel;

  ShopFavoritesSuccesState(this.favoritesModel);
}
class   ShopFavoritesErrorState extends ShopStates{
  final String error;
  ShopFavoritesErrorState(this.error);
}
class ShopProfileLoadingState extends ShopStates{}
class  ShopProfileSuccesState extends ShopStates{
  final ShopLoginModel ProfileModel;

  ShopProfileSuccesState(this.ProfileModel);
}
class   ShopProfileErrorState extends ShopStates{
  final String error;
  ShopProfileErrorState(this.error);
}
class ShopUpdateProfileLoadingState extends ShopStates{}
class  ShopUpdateProfileSuccesState extends ShopStates{
  final ShopLoginModel UpdateProfileModel;

  ShopUpdateProfileSuccesState(this.UpdateProfileModel);
}
class   ShopUpdateProfileErrorState extends ShopStates{
  final String error;
  ShopUpdateProfileErrorState(this.error);
}
class SocialProfileImagePickedSuccessState extends ShopStates{}
class SocialProfileImagePickedErrorState extends ShopStates{}
class ShoplogoutLoadingState extends ShopStates{}
class  ShoplogoutSuccesState extends ShopStates{
  final LogoutModel logoutModel;

  ShoplogoutSuccesState(this.logoutModel);
}
class   ShoplogoutErrorState extends ShopStates{
  final String error;
  ShoplogoutErrorState(this.error);
}
class ShoplpostCartsLoadingState extends ShopStates{}
class  ShoppostCartsSuccesState extends ShopStates{
  final Modelcarts modelcarts;

  ShoppostCartsSuccesState(this.modelcarts);
}
class   ShoppostCartsErrorState extends ShopStates{
  final String error;
  ShoppostCartsErrorState(this.error);
}