class UserModel {
  final String token;
  final String name;

  const UserModel(this.token, this.name);

  factory UserModel.fromJSON(Map<String, dynamic> json) => UserModel(
        json['p3'],
        json['p2'],
      );
}
