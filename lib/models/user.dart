import 'dart:convert';

class User {
  final String name;
  final String imgUrl;
  User({
    required this.name,
    required this.imgUrl,
  });

  User copyWith({
    String? name,
    String? imgUrl,
  }) {
    return User(
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'imgUrl': imgUrl});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(name: $name, imgUrl: $imgUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.name == name && other.imgUrl == imgUrl;
  }

  @override
  int get hashCode => name.hashCode ^ imgUrl.hashCode;
}
