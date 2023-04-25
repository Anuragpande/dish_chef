import 'dart:convert';
/// dishes : [{"name":"Masala Mughlai","rating":4.2,"description":"Chicken fried in deep tomato sauce with delicious spices","equipments":["Refrigerator","Microwave"],"image":"https://img.freepik.com/free-photo/top-view-delicious-corn-dog_23-2149387975.jpg","id":1},{"name":"Masala Paneer","rating":4.3,"description":"Paneer tossed in gravy","equipments":["Microwave"],"image":"https://img.freepik.com/free-photo/top-view-delicious-corn-dog_23-2149387975.jpg","id":2}]
/// popularDishes : [{"name":"Biryani","image":"https://img.freepik.com/free-photo/top-view-delicious-corn-dog_23-2149387975.jpg","id":3},{"name":"Daal Batti","image":"https://img.freepik.com/free-photo/top-view-delicious-corn-dog_23-2149387975.jpg","id":4},{"name":"Veg Korma","image":"https://img.freepik.com/free-photo/top-view-delicious-corn-dog_23-2149387975.jpg","id":5},{"name":"Chicken Korma","image":"https://img.freepik.com/free-photo/top-view-delicious-corn-dog_23-2149387975.jpg","id":6}]

DishesListModel dishesListModelFromJson(String str) => DishesListModel.fromJson(json.decode(str));
String dishesListModelToJson(DishesListModel data) => json.encode(data.toJson());
class DishesListModel {
  DishesListModel({
      this.dishes, 
      this.popularDishes,});

  DishesListModel.fromJson(dynamic json) {
    if (json['dishes'] != null) {
      dishes = [];
      json['dishes'].forEach((v) {
        dishes?.add(Dishes.fromJson(v));
      });
    }
    if (json['popularDishes'] != null) {
      popularDishes = [];
      json['popularDishes'].forEach((v) {
        popularDishes?.add(PopularDishes.fromJson(v));
      });
    }
  }
  List<Dishes>? dishes;
  List<PopularDishes>? popularDishes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dishes != null) {
      map['dishes'] = dishes?.map((v) => v.toJson()).toList();
    }
    if (popularDishes != null) {
      map['popularDishes'] = popularDishes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "Biryani"
/// image : "https://img.freepik.com/free-photo/top-view-delicious-corn-dog_23-2149387975.jpg"
/// id : 3

PopularDishes popularDishesFromJson(String str) => PopularDishes.fromJson(json.decode(str));
String popularDishesToJson(PopularDishes data) => json.encode(data.toJson());
class PopularDishes {
  PopularDishes({
      this.name, 
      this.image, 
      this.id,});

  PopularDishes.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    id = json['id'];
  }
  String? name;
  String? image;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['id'] = id;
    return map;
  }

}

/// name : "Masala Mughlai"
/// rating : 4.2
/// description : "Chicken fried in deep tomato sauce with delicious spices"
/// equipments : ["Refrigerator","Microwave"]
/// image : "https://img.freepik.com/free-photo/top-view-delicious-corn-dog_23-2149387975.jpg"
/// id : 1

Dishes dishesFromJson(String str) => Dishes.fromJson(json.decode(str));
String dishesToJson(Dishes data) => json.encode(data.toJson());
class Dishes {
  Dishes({
      this.name, 
      this.rating, 
      this.description, 
      this.equipments, 
      this.image, 
      this.id,});

  Dishes.fromJson(dynamic json) {
    name = json['name'];
    rating = json['rating'];
    description = json['description'];
    equipments = json['equipments'] != null ? json['equipments'].cast<String>() : [];
    image = json['image'];
    id = json['id'];
  }
  String? name;
  double? rating;
  String? description;
  List<String>? equipments;
  String? image;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['rating'] = rating;
    map['description'] = description;
    map['equipments'] = equipments;
    map['image'] = image;
    map['id'] = id;
    return map;
  }

}