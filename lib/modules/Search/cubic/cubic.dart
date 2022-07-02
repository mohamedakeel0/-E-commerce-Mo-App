import 'package:flutter1/layout/HomeApp/modelHome.dart';
import 'package:flutter1/models/SearchModel.dart';
import 'package:flutter1/modules/Search/cubic/states.dart';
import 'package:flutter1/shared/componnents0/Constants.dart';
import 'package:flutter1/shared/network/End_point.dart';
import 'package:flutter1/shared/network/remot/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopSearchCubic extends Cubit<ShopSearchStates>{
  ShopSearchCubic() : super(SearchInitailState());
  static ShopSearchCubic get(context) => BlocProvider.of(context);

  SearchModel?searchModel;
  void userSearch({required text
  }){
    emit(SearchLoadingState());
    DioHelper.postdata(url: SEARCH, data: {
      'text':text,
    },token: token).then((value) {
      print('search0000000055555555');
      searchModel=SearchModel.fromJson(value.data);
      print(value.data);
      emit(SearchSuccessState());
    }).catchError((error){
      emit(SearchErrorState(error.toString()));
    });
  }

}