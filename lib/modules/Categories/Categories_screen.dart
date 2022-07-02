import 'package:flutter/material.dart';
import 'package:flutter1/layout/cubic/cubic.dart';
import 'package:flutter1/layout/cubic/states.dart';
import 'package:flutter1/models/ModelCategories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Categories_screen extends StatelessWidget {
  const Categories_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubic, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubic = ShopCubic.get(context);
return ListView.separated(itemBuilder: (context, index) => buildCategories(cubic.modelCategories!.data!.data![index]), separatorBuilder: (context, index) => const Divider(), itemCount: cubic.modelCategories!.data!.data!.length);
      },
    );
  }

}

Widget buildCategories(DataCategories dataCategories)=>Padding(
  padding: const EdgeInsets.all(15.0),
  child: Row(children: [
    Image(
      image:NetworkImage(dataCategories.image!),
      width: 100,height: 100,
      fit: BoxFit.cover,
    ),SizedBox(width: 10,),
    Text(
      dataCategories.name!,
      style: TextStyle(
          fontSize: 16,fontWeight: FontWeight.w600
      ),
    ),
    Spacer(),
    TextButton(onPressed: (){}, child: Icon(Icons.arrow_forward_ios))
  ],),
);