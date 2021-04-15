import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/listpage/model.dart';

final postsProvider = StateNotifierProvider.autoDispose<PostNotifier, Response>((ref) {
  return PostNotifier();
});

class Response {
  List<Models> list;
  int page;
  bool isLoading = false;
  bool isLoadMoreError = false;
  bool isLoadMoreDone;
  
  Response({
    required this.list, 
    this.page: 0, 
    this.isLoading: true, 
    this.isLoadMoreError: false, 
    this.isLoadMoreDone: false
  });

  Response copyWith({
    List<Models>? list,
    int? page,
    bool? isLoading,
    bool? isLoadMoreError,
    bool? isLoadMoreDone,
  }) {
    return Response(
      list: list ?? this.list,
      page: page ?? this.page,
      isLoading: isLoading ?? this.isLoading,
      isLoadMoreError: isLoadMoreError ?? this.isLoadMoreError,
      isLoadMoreDone: isLoadMoreDone ?? this.isLoadMoreDone,
    );
  }
}

class PostNotifier extends StateNotifier<Response> {
  PostNotifier() : super(Response(list: [])) {
    _initPosts(0);
  }

  _initPosts([int? initPage]) async {
    final page = initPage ?? state.page;
    state = state.copyWith(isLoading: true);
    final posts = await getPosts(page);
    state = state.copyWith(page: page, isLoading: false, list: posts);
  }

  Future<List<Models>> getPosts(int page) async {
    await Future.delayed(const Duration(seconds: 1));
    return Future.value([Models(id: "$page", name: "$page, name")]);
  }

  loadMorePost() async {
    if (state.isLoading) {
      return;
    }
    state = state.copyWith(isLoading: true, isLoadMoreDone: false, isLoadMoreError: false);
    final posts = await getPosts(state.page + 1);
    if (posts == null) {
      state = state.copyWith(isLoadMoreError: true, isLoading: false);
      return;
    }

    if (posts.isNotEmpty) {
      state = state.copyWith(
          page: state.page + 1,
          isLoading: false,
          isLoadMoreDone: posts.isEmpty,
          list: [...state.list, ...posts]);
    } else {
      // not increment page
      state = state.copyWith(
        isLoading: false,
        isLoadMoreDone: posts.isEmpty,
      );
    }
  }


  Future<void> refresh() async {
    _initPosts(0);
  }
}




