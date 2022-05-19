import 'package:json_annotation/json_annotation.dart';
part 'post_placeholder.g.dart';

@JsonSerializable()
class PostPlaceHolder {
  int userId;
  int id;
  String title;
  String body;

  PostPlaceHolder(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory PostPlaceHolder.fromJson(Map<String, dynamic> json) =>
      _$PostPlaceHolderFromJson(json);

  Map<String, dynamic> toJson() => _$PostPlaceHolderToJson(this);
}
