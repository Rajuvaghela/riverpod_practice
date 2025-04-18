import 'package:riverpod_practice/screen/favorite/favorite_model.dart';

class FavouriteState {
  final List<FavoriteModel> allItems;
  final List<FavoriteModel> filteredItems;
  final String search;

  FavouriteState({
    required this.allItems,
    required this.filteredItems,
    required this.search,
  });

  FavouriteState copyWith({
    List<FavoriteModel>? allItems,
    List<FavoriteModel>? filteredItems,
    String? search,
  }) {
    return FavouriteState(
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
      search: search ?? this.search,
    );
  }
}
