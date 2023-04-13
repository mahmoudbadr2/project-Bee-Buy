class ShopModel {
  late String name;
  late String address;
  late String imageUrl;
  late String category;
  late String mallName;




  ShopModel(
      {required this.name,
        required this.address,
        required this.imageUrl,
        required this.mallName,
        required this.category,
      });

  /**MallrModel.updateUser({required String name, required String address}) {
      this.name = name;
      this.address = address;
      }**/

  ShopModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    imageUrl = json['imageUrl'];
    mallName = json['mallName'];
    category = json['category'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'imageUrl' : imageUrl,
      'mallName' : mallName,
      'category' : category,
    };
  }
}