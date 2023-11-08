import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_model.freezed.dart';
part 'posts_model.g.dart';

@freezed
class Posts with _$Posts {
  const factory Posts({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) = _Posts;

  factory Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);
}