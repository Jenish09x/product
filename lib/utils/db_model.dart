class DbModel {
  String? title, image, detail;
  int? id;
  dynamic price;

  DbModel({this.id, this.title, this.image, this.price, this.detail});

  factory DbModel.mapToModel(Map m1) {
    return DbModel(
      title: m1["title"],
      image: m1['image'],
      price: m1['price'],
      detail: m1['detail'],
      id: m1['id'],
    );
  }
}
