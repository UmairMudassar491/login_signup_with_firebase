class UserModel {
  final String? profileUrl;
  final String email;
  final String fullName;
  final String gender;
  final String phoneNo;
  final String language;
  final String country;
  final String city;
  final String password;

  UserModel({
    this.profileUrl,
    required this.fullName,
    required this.email,
    required this.gender,
    required this.phoneNo,
    required this.language,
    required this.country,
    required this.city,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'],
      email: json['email'],
      password: json['password'],
      phoneNo: json['phoneNo'],
      gender: json['gender'],
      language: json['language'],
      country: json['country'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
      'phoneNo': phoneNo,
      'gender': gender,
      'language': language,
      'country': country,
      'city': city,
      'profileUrl': profileUrl
    };
  }
}

class StudentModel extends UserModel {
  String age;

  StudentModel({
    required String fullName,
    required String email,
    required String password,
    required String gender,
    required String phoneNo,
    required String language,
    required String country,
    required String city,
    required this.age,
  }) : super(
          fullName: fullName,
          email: email,
          password: password,
          phoneNo: phoneNo,
          gender: gender,
          language: language,
          country: country,
          city: city,
        );
  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      age: json['age'],
      fullName: json['fullName'],
      email: json['email'],
      password: json['password'],
      phoneNo: json['phoneNo'],
      gender: json['gender'],
      language: json['language'],
      country: json['country'],
      city: json['city'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['age'] = age;
    return data;
  }
}

class TutorModel extends UserModel {
  double hourlyRate;
  String specializations;

  TutorModel({
    required String fullName,
    required String email,
    required String password,
    required String phoneNo,
    required String gender,
    required String language,
    required String country,
    required String city,
    required this.hourlyRate,
    required this.specializations,
  }) : super(
          fullName: fullName,
          email: email,
          password: password,
          phoneNo: phoneNo,
          gender: gender,
          language: language,
          country: country,
          city: city,
        );
  factory TutorModel.fromJson(Map<String, dynamic> json) {
    return TutorModel(
      hourlyRate: json['hourlyRate'],
      specializations: json['specializations'],
      fullName: json['name'],
      email: json['email'],
      password: json['password'],
      phoneNo: json['phoneNo'],
      gender: json['gender'],
      language: json['language'],
      country: json['country'],
      city: json['city'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['hourlyRate'] = hourlyRate;
    data['specializations'] = specializations;
    return data;
  }
}
