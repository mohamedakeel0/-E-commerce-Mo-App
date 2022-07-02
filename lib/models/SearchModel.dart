class SearchModel {
   bool? status;
     dynamic? message;
   Data? data;

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    message = json['message'];
    //print('messege : '+json['message'].runtimeType.toString());

    data = Data.fromJson(json['data']);
    //print('errrrrrrrrrrrr');


  }
}

class Data {
   int? currentPage;
   List<Product>? data = [];
   String? firstPageUrl;
   int? from;
   int? lastPage;
   String? lastPageUrl;
    dynamic nextPageUrl;
   String? path;
   int? perPage;
   dynamic prevPageUrl;
   int? to;
  dynamic total;



  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];


    if (json['data'] != null) {
      // print(json['data'].length.toString()+ 'length....');
      json['data'].forEach((v) {
        // print(55);
        data!.add(Product.fromJson(v));

      });
    }


    firstPageUrl = json['first_page_url'];

//print(firstPageUrl.toString()+' first zeft');
    from = json['from'];
//print(from.toString() + ' from');
    lastPage = json['last_page'];
    //print(lastPage.toString() + ' last_page');

    lastPageUrl = json['last_page_url'];
    // print(lastPageUrl);

    nextPageUrl = json['next_page_url'];
    //  print(nextPageUrl);

    path = json['path'];
    // print(path);

    perPage = json['per_page'];
    // print(perPage);

    prevPageUrl = json['prev_page_url'];
    // print(prevPageUrl);

    to = json['to'];
    //  print(to);

    total = json['total'];
    //print(total);

  }
}



class Product {
   int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
   String? image;
   String? name;
   String? description;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    price = json['price'];
//print(json['price'].runtimeType);
    oldPrice = json['old_price'];
    // print('old price: '+json['old_price'].runtimeType.toString());

    discount = json['discount'];
    //print('discount: '+json['discount'].runtimeType.toString());

    image = json['image'];

    name = json['name'];

    description = json['description'];

  }
}