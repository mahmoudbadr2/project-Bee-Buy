class MallrModel {
  late String name;
  late String address;
  late String image;


  MallrModel({required this.name, required this.address, required this.image});

  /**MallrModel.updateUser({required String name, required String address}) {
      this.name = name;
      this.address = address;
      }**/

  MallrModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    image = json['imageUrl'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'imageUrl' : image,
    };
  }
}