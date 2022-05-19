import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';

@JsonSerializable()
class Post {
  @JsonKey(name: 'user_id')
  int userId;
  int id;
  String type;
  String thumbnail;

  Post(
      {required this.userId,
      required this.id,
      required this.type,
      required this.thumbnail});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
