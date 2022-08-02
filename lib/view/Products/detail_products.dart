import 'package:flutter/material.dart';

import 'package:flutter1/bloc/cubic/cubic.dart';
import 'package:flutter1/bloc/cubic/states.dart';
import 'package:flutter1/shared/componnents0/components.dart';
import 'package:flutter1/shared/style/colors.dart';
import 'package:flutter1/view/HomeApp/modelHome.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class detail_products extends StatelessWidget {
  final Products model;
  detail_products(this.model);
  var boardController = PageController();



  @override
  Widget build(BuildContext context) {
     return BlocConsumer<ShopCubic, ShopStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubic = ShopCubic.get(context);
          return Scaffold(
            appBar: AppBar(title: Text('E -  Mo',style: TextStyle(
                fontSize:  32,
                fontWeight: FontWeight.w800,
                color: Colors.orangeAccent),),centerTitle: true,


            ),
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      onPageChanged: (index) {

                      },
                      physics: BouncingScrollPhysics(),
                      controller: boardController,
                      itemBuilder: (context, index) =>
                          buildBoardingItem(model,index),
                      itemCount: model.images!.length,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      SmoothPageIndicator(
                        controller: boardController,
                        count: model.images!.length,
                        effect: ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          activeDotColor: defaultcolor,
                          dotHeight: 10,
                          expansionFactor: 4,
                          dotWidth: 10,
                          spacing: 5,
                        ),
                      ),
                      Spacer(),
                      defaultButton(icon: true,
                          width: 150,shape: false,
                          function: () {


     cubic.postCarts(model.id!);




                          },
                          text: 'Add to Cart',
                          isUpperCase: false),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
Widget buildBoardingItem( model,index) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
        child: Image(
          image: NetworkImage('${model.images[index]}'),
        )),
    SizedBox(
      height: 30,
    ),
    Text(
      '${model.name}',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    ),
    SizedBox(
      height: 15,
    ),
    Text(
      '${model.price}',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    ),
    SizedBox(
      height: 15,
    ),
  ],
);

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image, required this.title, required this.body});
}
