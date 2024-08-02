class HomeModel {
  List<Product>? products;
  int? total;
  int? skip;
  int? limit;

  HomeModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory HomeModel.mapToModel(Map m1) => HomeModel(
        products: m1["products"] == null
            ? []
            : List<Product>.from(
                m1["products"]!.map((x) => Product.mapToModel(x))),
        total: m1["total"],
        skip: m1["skip"],
        limit: m1["limit"],
      );
}

class Product {
  int? id;
  String? title;
  String? description;
  Category? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  AvailabilityStatus? availabilityStatus;
  List<Review>? reviews;
  ReturnPolicy? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  factory Product.mapToModel(Map m1) => Product(
        id: m1["id"],
        title: m1["title"],
        description: m1["description"],
        category: categoryValues.map[m1["category"]]!,
        price: m1["price"]?.toDouble(),
        discountPercentage: m1["discountPercentage"]?.toDouble(),
        rating: m1["rating"]?.toDouble(),
        stock: m1["stock"],
        tags: m1["tags"] == null
            ? []
            : List<String>.from(m1["tags"]!.map((x) => x)),
        brand: m1["brand"],
        sku: m1["sku"],
        weight: m1["weight"],
        dimensions: m1["dimensions"] == null
            ? null
            : Dimensions.mapToModel(m1["dimensions"]),
        warrantyInformation: m1["warrantyInformation"],
        shippingInformation: m1["shippingInformation"],
        availabilityStatus:
            availabilityStatusValues.map[m1["availabilityStatus"]]!,
        reviews: m1["reviews"] == null
            ? []
            : List<Review>.from(
                m1["reviews"]!.map((x) => Review.mapToModel(x))),
        returnPolicy: returnPolicyValues.map[m1["returnPolicy"]]!,
        minimumOrderQuantity: m1["minimumOrderQuantity"],
        meta: m1["meta"] == null ? null : Meta.mapToModel(m1["meta"]),
        images: m1["images"] == null
            ? []
            : List<String>.from(m1["images"]!.map((x) => x)),
        thumbnail: m1["thumbnail"],
      );
}

enum AvailabilityStatus { IN_STOCK, LOW_STOCK }

final availabilityStatusValues = EnumValues({
  "In Stock": AvailabilityStatus.IN_STOCK,
  "Low Stock": AvailabilityStatus.LOW_STOCK
});

enum Category { BEAUTY, FRAGRANCES, FURNITURE, GROCERIES }

final categoryValues = EnumValues({
  "beauty": Category.BEAUTY,
  "fragrances": Category.FRAGRANCES,
  "furniture": Category.FURNITURE,
  "groceries": Category.GROCERIES
});

class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({
    this.width,
    this.height,
    this.depth,
  });

  factory Dimensions.mapToModel(Map m1) => Dimensions(
        width: m1["width"]?.toDouble(),
        height: m1["height"]?.toDouble(),
        depth: m1["depth"]?.toDouble(),
      );
}

class Meta {
  DateTime? createdAt;
  DateTime? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,
  });

  factory Meta.mapToModel(Map m1) => Meta(
        createdAt:
            m1["createdAt"] == null ? null : DateTime.parse(m1["createdAt"]),
        updatedAt:
            m1["updatedAt"] == null ? null : DateTime.parse(m1["updatedAt"]),
        barcode: m1["barcode"],
        qrCode: m1["qrCode"],
      );

  Map<String, dynamic> tom1() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "barcode": barcode,
        "qrCode": qrCode,
      };
}

enum ReturnPolicy {
  NO_RETURN_POLICY,
  THE_30_DAYS_RETURN_POLICY,
  THE_60_DAYS_RETURN_POLICY,
  THE_7_DAYS_RETURN_POLICY,
  THE_90_DAYS_RETURN_POLICY
}

final returnPolicyValues = EnumValues({
  "No return policy": ReturnPolicy.NO_RETURN_POLICY,
  "30 days return policy": ReturnPolicy.THE_30_DAYS_RETURN_POLICY,
  "60 days return policy": ReturnPolicy.THE_60_DAYS_RETURN_POLICY,
  "7 days return policy": ReturnPolicy.THE_7_DAYS_RETURN_POLICY,
  "90 days return policy": ReturnPolicy.THE_90_DAYS_RETURN_POLICY
});

class Review {
  int? rating;
  String? comment;
  DateTime? date;
  String? reviewerName;
  String? reviewerEmail;

  Review({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory Review.mapToModel(Map m1) => Review(
        rating: m1["rating"],
        comment: m1["comment"],
        date: m1["date"] == null ? null : DateTime.parse(m1["date"]),
        reviewerName: m1["reviewerName"],
        reviewerEmail: m1["reviewerEmail"],
      );
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
