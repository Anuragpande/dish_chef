class IngredientsModel {
  IngredientsModel({
      this.name, 
      this.id, 
      this.timeToPrepare, 
      this.ingredients,});

  IngredientsModel.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
    timeToPrepare = json['timeToPrepare'];
    ingredients = json['ingredients'] != null ? Ingredients.fromJson(json['ingredients']) : null;
  }
  String? name;
  int? id;
  String? timeToPrepare;
  Ingredients? ingredients;
IngredientsModel copyWith({  String? name,
  int? id,
  String? timeToPrepare,
  Ingredients? ingredients,
}) => IngredientsModel(  name: name ?? this.name,
  id: id ?? this.id,
  timeToPrepare: timeToPrepare ?? this.timeToPrepare,
  ingredients: ingredients ?? this.ingredients,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    map['timeToPrepare'] = timeToPrepare;
    if (ingredients != null) {
      map['ingredients'] = ingredients?.toJson();
    }
    return map;
  }

}

class Ingredients {
  Ingredients({
      this.vegetables, 
      this.spices, 
      this.appliances,});

  Ingredients.fromJson(dynamic json) {
    if (json['vegetables'] != null) {
      vegetables = [];
      json['vegetables'].forEach((v) {
        vegetables?.add(Vegetables.fromJson(v));
      });
    }
    if (json['spices'] != null) {
      spices = [];
      json['spices'].forEach((v) {
        spices?.add(Spices.fromJson(v));
      });
    }
    if (json['appliances'] != null) {
      appliances = [];
      json['appliances'].forEach((v) {
        appliances?.add(Appliances.fromJson(v));
      });
    }
  }
  List<Vegetables>? vegetables;
  List<Spices>? spices;
  List<Appliances>? appliances;
Ingredients copyWith({  List<Vegetables>? vegetables,
  List<Spices>? spices,
  List<Appliances>? appliances,
}) => Ingredients(  vegetables: vegetables ?? this.vegetables,
  spices: spices ?? this.spices,
  appliances: appliances ?? this.appliances,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (vegetables != null) {
      map['vegetables'] = vegetables?.map((v) => v.toJson()).toList();
    }
    if (spices != null) {
      map['spices'] = spices?.map((v) => v.toJson()).toList();
    }
    if (appliances != null) {
      map['appliances'] = appliances?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Appliances {
  Appliances({
      this.name, 
      this.image,});

  Appliances.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
  }
  String? name;
  String? image;
Appliances copyWith({  String? name,
  String? image,
}) => Appliances(  name: name ?? this.name,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    return map;
  }

}

class Spices {
  Spices({
      this.name, 
      this.quantity,});

  Spices.fromJson(dynamic json) {
    name = json['name'];
    quantity = json['quantity'];
  }
  String? name;
  String? quantity;
Spices copyWith({  String? name,
  String? quantity,
}) => Spices(  name: name ?? this.name,
  quantity: quantity ?? this.quantity,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['quantity'] = quantity;
    return map;
  }

}

class Vegetables {
  Vegetables({
      this.name, 
      this.quantity,});

  Vegetables.fromJson(dynamic json) {
    name = json['name'];
    quantity = json['quantity'];
  }
  String? name;
  String? quantity;
Vegetables copyWith({  String? name,
  String? quantity,
}) => Vegetables(  name: name ?? this.name,
  quantity: quantity ?? this.quantity,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['quantity'] = quantity;
    return map;
  }

}