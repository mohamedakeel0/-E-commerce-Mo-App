class HomeModel {
  bool? status;

  HomeDataModel? data;



  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    print('erroeee000000000');
    data = json['data'] != null ? new HomeDataModel.fromJson(json['data']) : null;
  }

}

class HomeDataModel {
  List<Banners>? banners=[];
  List<Products>? products=[];




  HomeDataModel.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {

      json['banners'].forEach((v) {
        banners!.add( Banners.fromJson(v));
      });
    }
    if (json['products'] != null) {

      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }

  }


}

class Banners {
  int? id;
  String? image;



  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }


}

class Products {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;


  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }


}