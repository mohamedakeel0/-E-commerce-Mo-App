import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/bloc/HomeApp/modelHome.dart';
import 'package:flutter1/bloc/cubic/cubic.dart';
import 'package:flutter1/bloc/cubic/states.dart';
import 'package:flutter1/models/ModelCategories.dart';
import 'package:flutter1/shared/componnents0/components.dart';
import 'package:flutter1/shared/style/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Products_Screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubic, ShopStates>(
        listener: (context, state) {
          if(state is ChangeFavoritesSuccesState){
            if(!state.changeFavoritesModel.status!){
              ShowToast(text: state.changeFavoritesModel.message!,state: Toaststates.ERROR);
            }
          }
        },
        builder: (context, state) {
          var cubic = ShopCubic.get(context);
          return ConditionalBuilder(
              condition: cubic.homeModel != null&&cubic.modelCategories!=null,
              builder: (context) {
                return productsBuilder(cubic.homeModel!,cubic.modelCategories!.data!,context);
              },
              fallback: (context) => Center(
                    child: CircularProgressIndicator(),
                  ));
        });
  }
}
Widget productsBuilder(HomeModel homeModel,CategoriesDataModel categoriesDataModel,context)=>SingleChildScrollView(
  physics: BouncingScrollPhysics(),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CarouselSlider(
          items: homeModel.data!.banners!
              .map(
                (e) => Image(
              image: NetworkImage('${e.image}'),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          )
              .toList(),
          options: CarouselOptions(
            viewportFraction: 1.0,
            height: 250,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          )),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 120,
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildCategories(categoriesDataModel.data![index]),
                  separatorBuilder: (context, index) =>
                      SizedBox(
                        width: 10,
                      ),
                  itemCount: categoriesDataModel.data!.length),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              'New Products',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
      Container(
        color: Colors.grey,
        child: GridView.count(
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 1 / 1.8,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: List.generate(homeModel.data!.products!.length,
                  (index) => buildGridproduct(homeModel.data!.products![index],context) ),
        ),
      )

    ],
  ),
);
Widget buildCategories(DataCategories model) =>Column(
  children: [
    Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child:
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor:
            Colors.grey.shade200,
            value: 0.65,
            valueColor:
            AlwaysStoppedAnimation<
                Color>(
                Colors.orangeAccent),
          ),
        ),
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
             model.image!),
        ),
      ],
    ),
    SizedBox(
      height: 5,
    ),
    Flexible(
      child: Text(
       model.name!,
        style: TextStyle(
            fontSize: 15,fontWeight: FontWeight.w500
        ),
      ),
    ),
  ],
);
