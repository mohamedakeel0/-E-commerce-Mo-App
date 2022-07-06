class Modelcarts {
bool? status;
String? message;
Data? data;



Modelcarts.fromJson(Map<String, dynamic> json) {
status = json['status'];
message = json['message'];
data = json['data'] != null ? new Data.fromJson(json['data']) : null;
}

}

class Data {
  int? id;
  int? quantity;
  Product? product;



  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

}

class Product {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;


  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
  }

}