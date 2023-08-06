class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],

    );  
  }

  Map<String, dynamic> toJson(){
    return{
      'id':id,
      'name':name,
      'description':description,
      'price': price,
      'image': image,
    };
  }
}
