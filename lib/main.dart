import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter1/shared/bloc_observer/blocObserver.dart';
import 'package:flutter1/shared/cubic_to_mode/cubic.dart';
import 'package:flutter1/shared/cubic_to_mode/states.dart';
import 'package:flutter1/shared/network/local/cache_helper.dart';
import 'package:flutter1/shared/network/remot/dio_helper.dart';
import 'package:flutter1/shared/style/Theme.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'layout/HomeApp/HomeApp.dart';
import 'layout/cubic/cubic.dart';
import 'modules/Search/login.dart';
import 'modules/Regisiter/cubic/cubic.dart';
import 'modules/first/firstscreen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();

  Bloc.observer = MyBlocObserver();

  DioHelper.init();
  await CacheHelper.init();
  dynamic token=CacheHelper.getData(key: 'token');
  print(token);
  Widget widget;
  if(token!=null)widget=ShopLayout();
  else widget=First_screen();
  runApp( MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  Widget? startWidget;

  MyApp({required this.startWidget}) ;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ShopCubic()..getDataHome()..getCategories()..getFavorites()..getProfile()

        ),

        BlocProvider(
            create: (context) => AppCubit()),
        BlocProvider(
            create: (context) =>  ShopRegisterCubic()),

      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,

            home:startWidget,
          );
        },
      ),
    );
  }
}




