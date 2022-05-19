import 'package:demo_retrofit_api/Models/post/data.dart';
import 'package:demo_retrofit_api/Models/post/post.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post_data.g.dart';

@JsonSerializable()
class PostData {
  bool success;
  String message;
  Data data;
  PostData({required this.success, required this.message, required this.data});

  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);

  Map<String, dynamic> toJson() => _$PostDataToJson(this);
}
