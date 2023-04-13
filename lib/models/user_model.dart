class SocialUserModel{
  late String name;
  late String email;
  late String uId;
  late String phone;
  late String cover="https://img.freepik.com/free-photo/empty-dark-room-modern-futuristic-sci-fi-background-3d-illustration_35913-2332.jpg?w=1380&t=st=1662340861~exp=1662341461~hmac=cd6b7b635097100f9aab58f91ea95247722760afce5713c8ea0e3114bd19cd4f";
  late String profile= "https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?w=1380&t=st=1662340809~exp=1662341409~hmac=3c523addc1c16987b9d2f13d204df7a73b3e0f7516355c389dbe9b6f3181b665";
  late String bio ="write your bio";

  SocialUserModel({required this.name, required this.email, required this.uId, required this.phone});

  SocialUserModel.updateUser({required String name, required String bio, required String cover, required String phone, required String profile, required String uId, required String email})
  {
    this.name = name;
    this.bio = bio;
    this.phone = phone;
    this.profile = profile;
    this.cover = cover;
    this.uId = uId;
    this.email = email;
  }

  SocialUserModel.fromJson(Map<String, dynamic> json)
  {
    email = json['email'];
    uId = json['uId'];
    phone = json['phone'];
    name = json['name'];
    profile = json['profile'];
    cover = json['cover'];
    bio = json['bio'];
  }

  Map<String, dynamic> toMap()
  {
    return{
      'email' : email,
      'name' : name,
      'phone' : phone,
      'bio' : bio,
      'profile' : profile,
      'cover' : cover,
      'uId' : uId,
    };
  }

}