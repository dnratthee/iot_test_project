class User {
  int? userId;
  String? fullname;
  String? username;
  String? password;
  int? age;
  String? email;
  String? token;

  User(
      {this.userId,
      this.fullname,
      this.username,
      this.password,
      this.age,
      this.email,
      this.token});

  factory User.fromJson(
    Map<String, dynamic> json,
  ) {
    if (json['data'] is! List<dynamic>) {
      return User(
        userId: json['user_id'],
        fullname: json['fullname'],
        username: json['username'],
        password: json['password'],
        age: json['age'],
        email: json['email'],
        token: json['token'],
      );
    }
    return User();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['fullname'] = fullname;
    data['username'] = username;
    data['password'] = password;
    data['age'] = age;
    data['email'] = email;
    data['token'] = token;
    return data;
  }
}
