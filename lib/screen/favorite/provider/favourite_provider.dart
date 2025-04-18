import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/screen/favorite/favorite_model.dart';
import 'package:riverpod_practice/screen/favorite/provider/favourite_state.dart';

final favouriteProvider =
    StateNotifierProvider<FavouriteNotifier, FavouriteState>((ref) {
      return FavouriteNotifier();
    });

class FavouriteNotifier extends StateNotifier<FavouriteState> {
  FavouriteNotifier()
    : super(FavouriteState(allItems: [], filteredItems: [], search: ''));

  void addItem() {
    List<FavoriteModel> item = [
      FavoriteModel(name: 'MacBook', id: 1, favourite: true),
      FavoriteModel(name: 'iphone', id: 2, favourite: false),
      FavoriteModel(name: 'G-force', id: 3, favourite: false),
      FavoriteModel(name: 'Samsung', id: 4, favourite: true),
      FavoriteModel(name: 'MacBook', id: 5, favourite: false),
      FavoriteModel(name: 'iPas', id: 6, favourite: false),
    ];
    state = state.copyWith(
      allItems: item.toList(),
      filteredItems: item.toList(),
    );
  }

  void filterList(String search) {
    state = state.copyWith(filteredItems: _filterItems(state.allItems, search));
  }

  List<FavoriteModel> _filterItems(List<FavoriteModel> items, String query) {
    if (query.isEmpty) {
      return items;
    }

    return items
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  void favourite(String option) {
    state = state.copyWith(
      filteredItems: _favouriteItem(state.allItems, option),
    );
  }

  List<FavoriteModel> _favouriteItem(List<FavoriteModel> items, String option) {
    if (option == 'All') {
      return items;
    }

    return items.where((item) => item.favourite == true).toList();
  }
}
