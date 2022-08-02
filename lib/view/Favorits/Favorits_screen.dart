import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/bloc/cubic/cubic.dart';
import 'package:flutter1/bloc/cubic/states.dart';
import 'package:flutter1/models/FavoritesModel.dart';
import 'package:flutter1/shared/style/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favorits_screen extends StatelessWidget {
  const Favorits_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubic, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubic = ShopCubic.get(context);
        return ConditionalBuilder(condition:cubic.favoritesModel != null && state is! ShopFavoritesLoadingState &&cubic.homeModel!=null , builder: (context) => ListView.separated(
            itemBuilder: (context, index) => buildFavorits(
                context, cubic.favoritesModel!.data!.data![index]),
            separatorBuilder: (context, index) => Divider(),
            itemCount: cubic.favoritesModel!.data!.data!.length), fallback: (context) => Center(
          child: CircularProgressIndicator(),
        ));
      },
    );
  }
}

Widget buildFavorits(context, FavoritesData favoritesData) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image(
                  image: NetworkImage(
                    favoritesData.product!.image!,
                  ),
                  width: 120,
                  height: 120,
                ),
                if (favoritesData.product!.discount! != 0)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      color: Colors.red,
                      child: Text(
                        'DISCOUNT',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    favoritesData.product!.name!,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        'addsdad',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.blueGrey,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          ShopCubic.get(context)
                              .postChangeFavorites(favoritesData.product!.id!);
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 34,
                              height: 34,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                backgroundColor: Colors.grey.shade200,
                                value: 0.65,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white12),
                              ),
                            ),
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: ShopCubic.get(context)
                                      .favorites[favoritesData.product!.id!]!
                                  ? defaultcolor
                                  : Colors.grey,
                              child: Icon(
                                Icons.favorite_border,
                                color: ShopCubic.get(context)
                                        .favorites[favoritesData.product!.id!]!
                                    ? Colors.white
                                    : Colors.white54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
