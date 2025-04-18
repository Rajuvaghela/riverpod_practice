import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider = StateNotifierProvider<SearchNotifier, SearchState>((
  ref,
) {
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState(search: '',onChange: false));

  void search(String query) {
    state = state.copyWith(search: query);
  }
  void onChange(bool query) {
    state = state.copyWith(onChange: query);
  }
}

class SearchState {
  final String search;
  final bool onChange;

  SearchState({required this.search, required this.onChange});

  SearchState copyWith({String? search, bool? onChange}) {
    return SearchState(
      search: search ?? this.search,
      onChange: onChange ?? this.onChange,
    );
  }
}
