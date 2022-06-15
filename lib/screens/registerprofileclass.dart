
class OwnerProfile {

  String name;
  String email;
  String gender;
  String status;

  int getGenderNo(String gender)
  {
    if(gender=="male")
      return 0;
    if(gender=="female")
      return 1;
    return 2;
  }

  factory OwnerProfile.fromJson(Map<String, dynamic> json) {
    return OwnerProfile(

        name: json['name'] as String,
        email:json['email'] as String,
        gender: json['gender'] as String,
        status: json['status'] as String,
    );
  }

  OwnerProfile({

    required this.name,
    required this.email,
    required this.gender,
    required this.status,


  });

  @override
  String toString() {
    return 'OwnerProfile{name: $name,email: $email,  gender: $gender, status: $status}';
  }
}


class Utilities{

  static String email="ok";
  static String usertype="ok";

  static String logphoto="ok";
  static String loginfo="ok";

  //static OwnerProfile ownerProfile =OwnerProfile(loginid: "", firstname: "", lastname: "", gender: "", dob: "");
  static OwnerProfile ownerProfile=OwnerProfile(name: "", email: "", gender: "", status: "");

}