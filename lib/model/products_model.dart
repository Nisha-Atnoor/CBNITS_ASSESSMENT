class ProductsModel{
  // int itemId;
   String title;
   dynamic price;
   String thumbNail;


  ProductsModel({this.thumbNail,this.title,this.price});

  factory ProductsModel.fromJson(Map<String,dynamic> jsonData){
    return ProductsModel(
      // itemId: jsonData['id'],
       title: jsonData['title'],
      price: jsonData['price'] ,
      thumbNail: jsonData['image']
    );
  }
}


class JewelleryModel{
  // int itemId;
  String title;
  dynamic price;
  String thumbNail;

  JewelleryModel({this.thumbNail,this.title,this.price});

  factory JewelleryModel.fromJson(Map<String,dynamic> jsonData){
    return JewelleryModel(
      // itemId: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'] ,
        thumbNail: jsonData['image']
    );
  }
}


class MensClothingModel{
  // int itemId;
  String title;
  dynamic price;
  String thumbNail;

  MensClothingModel({this.thumbNail,this.title,this.price});

  factory MensClothingModel.fromJson(Map<String,dynamic> jsonData){
    return MensClothingModel(
      // itemId: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'] ,
        thumbNail: jsonData['image']
    );
  }
}