import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter1/bloc/cubic/cubic.dart';

import 'package:flutter1/shared/style/colors.dart';
import 'package:flutter1/shared/style/colors.dart';
import 'package:flutter1/view/Products/detail_products.dart';

import 'package:fluttertoast/fluttertoast.dart';

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        navigateTo(context, Widget);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage("${article['urlToImage']}"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "${article['title']}",
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                          fontSize: 10),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget articlebuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticleItem(list[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: list.length),
      fallback: (context) =>
          isSearch ? Container() : Center(child: CircularProgressIndicator()),
    );

Widget defaultFormField({
  required TextEditingController? controller,
  required TextInputType? type,
  EdgeInsetsGeometry? contentPadding,
  TextStyle? textStyle,
  TextStyle? labelStyle,
  InputBorder? enabledBorder,
  bool isPassword = false,
  ValueChanged? change,
  VoidCallback? suffixPressed,
  required FormFieldValidator validate,
  String? label,
  IconData? prefix,
  String? hintText,
  OutlineInputBorder? myfocusborder,
  ValueChanged? onSubmit,
  IconData? suffix,
  bool isClickable = true,
  GestureTapCallback? TapWhenClick,
}) =>
    TextFormField(
      onTap: TapWhenClick,
      controller: controller,
      style: textStyle,
      keyboardType: type,
      obscureText: isPassword,
      validator: validate,
      enabled: isClickable,
      onChanged: change,
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: enabledBorder,
        labelText: label,
        labelStyle: labelStyle,
        focusedBorder: myfocusborder,
        contentPadding: contentPadding,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.orangeAccent,
  Color Textcolor = Colors.white,
  bool isUpperCase = true,
  double radius = 3.0,
  bool shape = true,

  bool icon = false,
  required VoidCallback? function,
  required String text,
}) =>
    Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child:icon?Row(mainAxisAlignment: MainAxisAlignment.start,children: [

          InkWell(child: Icon(Icons.shopping_cart_outlined,color: Colors.black87,),onTap: (){},),

          Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Textcolor,fontWeight: FontWeight.w700,fontSize: 17,
          ),
        ),],): Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Textcolor,fontWeight: FontWeight.w700,fontSize: 17,
          ),
        )
      ),
      decoration: shape
          ? ShapeDecoration(
              color: Colors.red,
              shape: StadiumBorder(
                side: BorderSide(
                  width: 2,
                  color: Colors.white,
                ),
              ),
            )
          : ShapeDecoration(
              color: background,
              shape: StadiumBorder(
                side: BorderSide(
                  width: 2,
                  color: Colors.white,
                ),
              ),
            ),
    );

void ShowToast({required String text, required Toaststates state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);
enum Toaststates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(Toaststates state) {
  Color color;
  switch (state) {
    case Toaststates.SUCCESS:
      color = Colors.orangeAccent;
      break;
    case Toaststates.ERROR:
      color = Colors.red;
      break;
    case Toaststates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget buildGridproduct(model, context, {bool isOldprice = true}) => InkWell(
      onTap: () {navigateTo(context, detail_products(model));},
      child: Container(
        color: Colors.white,
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(alignment: Alignment.topLeft, children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image(
                    image: NetworkImage(
                      model.image!,
                    ),
                    width: double.infinity,
                    height: 150,
                  ),
                ),
                if (model.discount != 0 && isOldprice)
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
              ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      model.name!,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text(
                          model.price!.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: Colors.blueGrey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        if (model.discount != 0 && isOldprice)
                          Text(
                            model.oldPrice.toString(),
                            style: TextStyle(
                                fontSize: 9,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: InkWell(
                            onTap: () {
                              ShopCubic.get(context)
                                  .postChangeFavorites(model.id!);
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
                                          .favorites[model.id]!
                                      ? defaultcolor
                                      : Colors.grey,
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: ShopCubic.get(context)
                                            .favorites[model.id]!
                                        ? Colors.white
                                        : Colors.white54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
