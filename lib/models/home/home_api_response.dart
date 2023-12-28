class HomeApiResponse {
  final List<dynamic>? slider;
  final List<SubProfile>? subProfiles;
  final Profile? profile;
  final List<Category>? categories;

  HomeApiResponse({
    this.slider,
    this.subProfiles,
    this.profile,
    this.categories,
  });

  HomeApiResponse copyWith({
    List<dynamic>? slider,
    List<SubProfile>? subProfiles,
    Profile? profile,
    List<Category>? categories,
  }) =>
      HomeApiResponse(
        slider: slider ?? this.slider,
        subProfiles: subProfiles ?? this.subProfiles,
        profile: profile ?? this.profile,
        categories: categories ?? this.categories,
      );
}

class Category {
  final int? id;
  final String? title;
  final dynamic image;

  Category({
    this.id,
    this.title,
    this.image,
  });

  Category copyWith({
    int? id,
    String? title,
    dynamic image,
  }) =>
      Category(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
      );
}

class Profile {
  final int? id;
  final User? user;
  final dynamic profileImg;
  final String? gender;
  final String? age;
  final String? weight;
  final String? height;

  Profile({
    this.id,
    this.user,
    this.profileImg,
    this.gender,
    this.age,
    this.weight,
    this.height,
  });

  Profile copyWith({
    int? id,
    User? user,
    dynamic profileImg,
    String? gender,
    String? age,
    String? weight,
    String? height,
  }) =>
      Profile(
        id: id ?? this.id,
        user: user ?? this.user,
        profileImg: profileImg ?? this.profileImg,
        gender: gender ?? this.gender,
        age: age ?? this.age,
        weight: weight ?? this.weight,
        height: height ?? this.height,
      );
}

class User {
  final String? name;
  final String? email;

  User({
    this.name,
    this.email,
  });

  User copyWith({
    String? name,
    String? email,
  }) =>
      User(
        name: name ?? this.name,
        email: email ?? this.email,
      );
}

class SubProfile {
  final int? id;
  final dynamic profileImg;
  final String? name;
  final String? color;
  final String? gender;
  final String? age;
  final String? weight;
  final String? height;
  final int? user;

  SubProfile({
    this.id,
    this.profileImg,
    this.name,
    this.color,
    this.gender,
    this.age,
    this.weight,
    this.height,
    this.user,
  });

  SubProfile copyWith({
    int? id,
    dynamic profileImg,
    String? name,
    String? color,
    String? gender,
    String? age,
    String? weight,
    String? height,
    int? user,
  }) =>
      SubProfile(
        id: id ?? this.id,
        profileImg: profileImg ?? this.profileImg,
        name: name ?? this.name,
        color: color ?? this.color,
        gender: gender ?? this.gender,
        age: age ?? this.age,
        weight: weight ?? this.weight,
        height: height ?? this.height,
        user: user ?? this.user,
      );
}
