class ModelCategories {
  bool? status;

  CategoriesDataModel? data;

  ModelCategories.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    data = json['data'] != null ? new CategoriesDataModel.fromJson(json['data']) : null;
  }
}

class CategoriesDataModel {
  int? currentPage;
  List<DataCategories>? data;


  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <DataCategories>[];
      json['data'].forEach((v) {
        data!.add(new DataCategories.fromJson(v));
      });
    }

  }
}

class DataCategories {
  int? id;
  String? name;
  String? image;

  DataCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
