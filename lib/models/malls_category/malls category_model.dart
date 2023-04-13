class MallCategory {
  late String mallname;
  late String name;

  MallCategory({required this.name, required this.mallname});

  /**MallrModel.updateUser({required String name, required String address}) {
      this.name = name;
      this.address = address;
      }**/

  MallCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mallname = json['MallName'];
  }

   Map<String, dynamic> toMap() {
    return {
      'name': name,
      'MallName': mallname,
    };
  }
}

