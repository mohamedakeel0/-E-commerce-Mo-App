import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';

import 'package:flutter1/shared/componnents0/components.dart';
import 'package:flutter1/view/Search/cubic/cubic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubic/states.dart';

class Login extends StatelessWidget {
  TextEditingController SearchController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopSearchCubic(),
      child: BlocConsumer<ShopSearchCubic, ShopSearchStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubic = ShopSearchCubic.get(context);

                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.orangeAccent,
                      title: Container(
                        color: Colors.white,
                        child: TextFormField( onFieldSubmitted: (value){
                      ShopSearchCubic.get(context).userSearch(text:value);
                      },
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {

                                  },
                                  icon: Icon(Icons.send),
                                ),
                                hintText: "Search",
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                                hintStyle:
                                    TextStyle(color: Colors.orangeAccent))
                        ),
                      ),
                    ),
                    body: Form(key:formkey ,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            if (state is  SearchLoadingState)
                              LinearProgressIndicator(),
                            SizedBox(height: 10,),
                            if(state is SearchSuccessState &&cubic.searchModel!=null)
                            Expanded(
                              child: ListView.separated(
                                  itemBuilder: (context, index) => buildGridproduct(
                                      ShopSearchCubic.get(context).searchModel!.data!.data![index], context,isOldprice: false),
                                  separatorBuilder: (context, index) => myDivider(),
                                  itemCount:  ShopSearchCubic.get(context).searchModel!.data!.data!.length),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );

          }),
    );
  }
}
