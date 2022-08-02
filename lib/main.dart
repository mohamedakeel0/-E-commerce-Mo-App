import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter1/bloc/bloc_observer/blocObserver.dart';
import 'package:flutter1/bloc/cubic/states.dart';
import 'package:flutter1/bloc/cubic_regisiter/cubic.dart';
import 'package:flutter1/bloc/cubic_to_mode/cubic.dart';

import 'package:flutter1/shared/network/local/cache_helper.dart';
import 'package:flutter1/shared/network/remot/dio_helper.dart';
import 'package:flutter1/shared/style/Theme.dart';
import 'package:flutter1/view/HomeApp/HomeApp.dart';

import 'package:flutter1/view/first/firstscreen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/cubic/cubic.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();

  Bloc.observer = MyBlocObserver();

  DioHelper.init();
  await CacheHelper.init();
  dynamic token=CacheHelper.getData(key: 'token');
  print(token);
  Widget widget;
  if(token!=null  )widget=ShopLayout();
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
      child: BlocConsumer<ShopCubic, ShopStates>(
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




