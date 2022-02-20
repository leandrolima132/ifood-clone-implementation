import 'dart:convert';

class Category {
  final String name;
  final String picture;
  Category({
    required this.name,
    required this.picture,
  });

  Category copyWith({
    String? name,
    String? picture,
  }) {
    return Category(
      name: name ?? this.name,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'picture': picture,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'] ?? '',
      picture: map['picture'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));
}
