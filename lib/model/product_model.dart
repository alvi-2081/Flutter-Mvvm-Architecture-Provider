class ProductModel {
  String? sId;
  String? productname;
  int? price;
  String? uploadDate;
  String? category;
  bool? status;
  String? image;
  int? iV;

  ProductModel(
      {this.sId,
      this.productname,
      this.price,
      this.uploadDate,
      this.category,
      this.status,
      this.image,
      this.iV});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productname = json['productname'];
    price = json['price'];
    uploadDate = json['upload_date'];
    category = json['category'];
    status = json['status'];
    image = json['image'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['productname'] = this.productname;
    data['price'] = this.price;
    data['upload_date'] = this.uploadDate;
    data['category'] = this.category;
    data['status'] = this.status;
    data['image'] = this.image;
    data['__v'] = this.iV;
    return data;
  }
}
