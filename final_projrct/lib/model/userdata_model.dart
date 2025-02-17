class UserModel
{
  int id;
  String firstName;
  String email;
  String lastName;
  String avatar;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatar
});

  static UserModel fromMap(Map map){
    return UserModel(
        id: map['id'],
        firstName: map['first_name'],
        lastName: map['last_name'],
        email: map['email'],
        avatar: map['avatar']);
  }


}