class FavoriteModel {
  final String name;
  final int id;
  final bool favourite;

  FavoriteModel({
    required this.name,
    required this.id,
    required this.favourite,
  });

  FavoriteModel copyWith({String? name, int? id, bool? favourite}) {
    return FavoriteModel(
      name: name ?? this.name,
      id: id ?? this.id,
      favourite: favourite ?? this.favourite,
    );
  }
}
