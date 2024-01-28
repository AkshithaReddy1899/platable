// ignore_for_file: prefer_collection_literals

class ProductModel {
  List<Products>? products;

  ProductModel({this.products});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? image;
  String? icon;
  String? brandColor;
  String? color;
  String? productName;
  TimeSlot? timeSlot;
  String? stars;
  String? distance;
  int? stock;
  int? actualPrice;
  int? todayPrice;
  String? description;
  int? quantity;
  List<Reviews>? reviews;

  Products(
      {this.id,
      this.name,
      this.image,
      this.icon,
      this.brandColor,
      this.color,
      this.productName,
      this.timeSlot,
      this.stars,
      this.distance,
      this.stock,
      this.actualPrice,
      this.todayPrice,
      this.description,
      this.quantity,
      this.reviews});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    icon = json['icon'];
    brandColor = json['brand_color'];
    color = json['color'];
    productName = json['product_name'];
    timeSlot =
        json['time_slot'] != null ? TimeSlot.fromJson(json['time_slot']) : null;
    stars = json['stars'];
    distance = json['distance'];
    stock = json['stock'];
    actualPrice = json['actual_price'];
    todayPrice = json['today_price'];
    description = json['description'];
    quantity = json['quantity'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['icon'] = icon;
    data['brand_color'] = brandColor;
    data['color'] = color;
    data['product_name'] = productName;
    if (timeSlot != null) {
      data['time_slot'] = timeSlot!.toJson();
    }
    data['stars'] = stars;
    data['distance'] = distance;
    data['stock'] = stock;
    data['actual_price'] = actualPrice;
    data['today_price'] = todayPrice;
    data['description'] = description;
    data['quantity'] = quantity;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TimeSlot {
  String? day;
  String? timeRange;

  TimeSlot({this.day, this.timeRange});

  TimeSlot.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    timeRange = json['time_range'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['day'] = day;
    data['time_range'] = timeRange;
    return data;
  }
}

class Reviews {
  Name? name;
  String? comment;
  double? reviewStars;
  String? time;

  Reviews({this.name, this.comment, this.reviewStars, this.time});

  Reviews.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      name = Name.fromJson(json['name']);
    }
    comment = json['comment'];
    reviewStars = json['review_stars'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['comment'] = comment;
    data['review_stars'] = reviewStars;
    data['time'] = time;
    return data;
  }
}

class Name {
  String? firstName;
  String? lastName;

  Name({this.firstName, this.lastName});

  Name.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    return data;
  }
}
